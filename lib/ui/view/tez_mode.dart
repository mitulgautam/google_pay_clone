import 'package:flutter/material.dart';
import 'package:google_pay_clone/resources/color_scheme.dart';
import 'dart:math' as math;
import 'homepage.dart';

class TezMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsScheme.gPayBlue,
        body: Column(
          children: <Widget>[
            Container(
              width: util.size.width,
              height: util.size.height / 10 * 6.4,
              child: Center(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(util.size.width / 6.4)),
                  child: Container(
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: DragTarget(
                              builder: (_, List<List<String>> str, __) =>
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    minRadius: util.size.width / 10,
                                    maxRadius: util.size.width / 10,
                                    child: Text(
                                      'Pay',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  ),
                              onWillAccept: (data) => true,
                              onAccept: (data) => print('Pay'),
                            ),
                          ),
                          _centerDot(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: DragTarget(
                              builder: (_, List<List<String>> str, __) =>
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    minRadius: util.size.width / 10,
                                    maxRadius: util.size.width / 10,
                                    child: Text(
                                      'Receive',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  ),
                              onWillAccept: (data) => true,
                              onAccept: (data) => CircleAvatar(
                                    minRadius: util.size.width / 10,
                                    maxRadius: util.size.width / 10,
                                    backgroundColor: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: util.size.height / 10 * 3.2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 32.0, right: 32.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Transform.rotate(
                              angle: math.pi / 2,
                              child: Icon(Icons.filter_list)),
                          Text('Tez Mode'),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_up)
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _centerDot() {
    return Draggable(
        onDragCompleted: () {
          print("Completed");
        },
        dragAnchor: DragAnchor.child,
        axis: Axis.vertical,
        data: ["Pay", "Receive"],
        child: CircleAvatar(
          minRadius: util.size.width / 10,
          maxRadius: util.size.width / 10,
          backgroundColor: Colors.white,
        ),
        feedback: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            minRadius: util.size.width / 10,
            maxRadius: util.size.width / 10,
          ),
        ),
        childWhenDragging: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Container(
            height: util.size.width / 5,
            width: util.size.width / 10,
          ),
        ));
  }
}
