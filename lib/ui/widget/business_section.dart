import 'package:flutter/material.dart';
import 'package:google_pay_clone/ui/shared/business_name.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';

class BusinessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 8.0, bottom: 8.0),
          child: Text(
            'BUSINESSES',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            children: <Widget>[
              BusinessCard('Gold Vault', 'assets/gold.png'),
              BusinessCard('Airtel Payment', 'assets/airtel.png'),
              Card(
                elevation: 0.0,
                child: SizedBox(
                  width: util.size.width / 4.5,
                  height: util.size.width / 4.5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.indigo,
                          minRadius: util.size.width / 16.0,
                          maxRadius: util.size.width / 16.0,
                          child: Image.asset(
                            'assets/train.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text("Trains"),
                      ],
                    ),
                  ),
                ),
              ),
              BusinessCard('UPPCL Bills', 'assets/uppcl.jpg'),
              BusinessCard('Amazon', 'assets/amazon.png'),
              BusinessCard('Jio', 'assets/jio.png'),
              BusinessCard('IGL', 'assets/igl.png'),
            ],
          ),
        ),
      ],
    );
  }
}
