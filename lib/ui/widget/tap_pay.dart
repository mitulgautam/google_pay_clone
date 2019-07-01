import 'package:flutter/material.dart';
import 'package:google_pay_clone/core/viewmodel/homepage_viewmodel.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';
import 'dart:math' as math;
import 'package:google_pay_clone/ui/view/te.dart';

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
          child: Draggable(
            axis: Axis.vertical,
            onDragStarted: () {
              print("Drag Started");
              model.tezOn = true;
            },
            onDragEnd: (_) {
              print("Drag End");
              if (model.dataAcceptReceive != true &&
                  model.dataAcceptPay != true) {
                model.tezOn = false;
              }
            },
            feedback:
                model.dataAcceptPay == true || model.dataAcceptReceive == true
                    ? Container()
                    : _feedbackGpay(model),
            childWhenDragging: MTest(model),
            child:
                model.dataAcceptPay == true || model.dataAcceptReceive == true
                    ? MTest(model)
                    : _gpayTapChild(model),
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
