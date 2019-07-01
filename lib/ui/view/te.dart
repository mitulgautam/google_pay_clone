import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_pay_clone/core/viewmodel/homepage_viewmodel.dart';

import 'homepage.dart';

class MTest extends StatelessWidget {
  final HomepageModel model;

  MTest(this.model);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(util.size.width),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: util.size.width / 4,
              height: util.size.height / 3,
              color: Colors.black12,
            ),
          ),
          SizedBox(
            width: util.size.width / 3,
            height: util.size.height / 2.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: model.dataAcceptReceive == false &&
                      model.dataAcceptPay == false
                  ? <Widget>[_text("RECEIVE"), _text("PAY")]
                  : model.dataAcceptPay == true &&
                          model.dataAcceptReceive == false
                      ? <Widget>[_text("RECEIVE"), _anim()]
                      : <Widget>[_anim(), _text("PAY")],
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(String text) {
    return DragTarget(
      onAccept: (data) {
        text == "RECEIVE" &&
                model.dataAcceptReceive == false &&
                model.dataAcceptPay == false
            ? model.dataAcceptReceive = true
            : model.dataAcceptPay = true;
      },
      onWillAccept: (data) {
        return true;
      },
      builder: (_, __, ___) => SizedBox(
            width: util.size.width / 2,
            height: util.size.height / 5.4,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
    );
  }

  Widget _anim() {
    return SizedBox(
      width: util.size.width / 2,
      height: util.size.height / 5.4,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            minRadius: util.size.width / 8,
            child: CircleAvatar(
              minRadius: util.size.width / 11,
              maxRadius: util.size.width / 11,
              backgroundColor: Colors.lightBlue,
            ),
          ),
          FlareActor(
            "assets/payAnim.flr",
            animation: "Untitled",
            isPaused: false,
          ),
        ],
      ),
    );
  }
}
