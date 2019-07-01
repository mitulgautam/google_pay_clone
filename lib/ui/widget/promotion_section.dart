import 'package:flutter/material.dart';
import 'package:google_pay_clone/ui/shared/business_name.dart';

class PromotionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 8.0, bottom: 8.0),
              child: Text(
                'PROMOTIONS',
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              children: <Widget>[
                BusinessCard('Rewards', 'assets/trophy.png'),
                BusinessCard('Offers', 'assets/tag.png'),
                BusinessCard('TezShot', 'assets/cricket.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
