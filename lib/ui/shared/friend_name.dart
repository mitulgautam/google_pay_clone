import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';

class FriendCard extends StatelessWidget {
  final String name;

  FriendCard(this.name);

  final List<Color> color = [
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
              backgroundColor: color[0],
              minRadius: util.size.width / 16.0,
              maxRadius: util.size.width / 16.0,
              child: Text(name[0]),
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
