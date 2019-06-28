import 'package:flutter/material.dart';
import 'package:google_pay_clone/core/viewmodel/homepage_viewmodel.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';
import 'dart:math' as math;

class TapPay extends StatelessWidget {
  final HomepageModel model;

  TapPay(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: util.size.height / 5,
          width: util.size.width / 5,
        ),
        Opacity(
          opacity: model.opacity,
          child: LongPressDraggable(
            axis: Axis.vertical,
            onDragStarted: () {
              model.tezOn = true;
            },
            hapticFeedbackOnStart: true,
            onDragEnd: (_) {
              model.tezOn = false;
            },
            feedback: _feedbackGpay(model),
            childWhenDragging: _gpayChildWhileDragging(model),
            child: _gpayTapChild(model),
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        model.tezOn != true
            ? Text(
                "Tap for Tez Mode",
                style: TextStyle(color: Colors.white),
              )
            : Container(),
      ],
    );
  }

  Widget _gpayTapChild(HomepageModel model) {
    return SizedBox(
      width: util.size.width / 4,
      child: Transform.rotate(
          angle: math.pi / 2,
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            minRadius: util.size.width / 8,
            child: CircleAvatar(
              minRadius: util.size.width / 10,
              maxRadius: util.size.width / 10,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.filter_list,
                size: util.size.width / 16,
                color: Colors.grey,
              ),
            ),
          )),
    );
  }

  Widget _gpayChildWhileDragging(HomepageModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(util.size.width / 6),
      child: AnimatedContainer(
        color: Colors.black12,
        width: util.size.width / 4,
        height:
            model.tezOn == false ? util.size.width / 4 : util.size.height / 3,
        duration: Duration(milliseconds: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            model.tezOn == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DragTarget(
                      onAccept: (data) {},
                      onWillAccept: (data) {return true;},
                      builder: (_, __, ___) => Text(
                            'PAY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    ),
                  )
                : Container(),
            model.tezOn == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DragTarget(
                      onWillAccept: (data) {return true;},
                      onAccept: (data) {},
                      builder: (_, __, ___) => Text(
                            'RECEIVE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _feedbackGpay(HomepageModel model) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      child: SizedBox(
        width: util.size.width / 4,
        child: Transform.rotate(
            angle: math.pi / 2,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              minRadius: util.size.width / 8,
              child: CircleAvatar(
                minRadius: util.size.width / 11,
                maxRadius: util.size.width / 11,
                backgroundColor: Colors.white,
              ),
            )),
      ),
    );
  }
}
