import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';

class BusinessCard extends StatelessWidget {
  final String name;
  final String image;

  BusinessCard(this.name, this.image);

  List<Color> color = [
    Colors.indigo,
    Colors.amber[500],
    Colors.green,
    Colors.brown,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: util.size.width / 4.4,
      height: util.size.width / 4.4,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: util.size.width / 16.0,
              maxRadius: util.size.width / 16.0,
              child: Image.asset(image),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
