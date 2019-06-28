import 'package:flutter/material.dart';
import 'package:google_pay_clone/resources/color_scheme.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';

Widget customAppBar() {
  return AppBar(
    elevation: 0.0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CircleAvatar(
            minRadius: 8.0,
            maxRadius: 20.0,
            child: Image.asset('assets/profile.jpeg'),
          ),
        ),
        SizedBox(
          width: util.size.width / 32,
        ),
        Text('Mitul Gautam')
      ],
    ),
    backgroundColor: ColorsScheme.gPayBlue,
    actions: <Widget>[
      InkWell(
        child: PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Refferal Code'),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text('Scan QR Code'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('Display QR Code'),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text('Send Feedback'),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 4,
                  )
                ]),
      )
    ],
  );
}
