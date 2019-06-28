import 'package:flutter/material.dart';
import 'package:google_pay_clone/resources/color_scheme.dart';
import 'package:google_pay_clone/ui/shared/friend_name.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';

class FriendSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        children: <Widget>[
          SizedBox(
            width: util.size.width / 4.5,
            height: util.size.width / 4.5,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    minRadius: util.size.width / 16.0,
                    maxRadius: util.size.width / 16.0,
                    backgroundColor: ColorsScheme.gPayBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        minRadius: util.size.width / 12.0,
                        maxRadius: util.size.width / 12.0,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            minRadius: util.size.width / 12.0,
                            maxRadius: util.size.width / 12.0,
                            child: Icon(
                              Icons.attach_money,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('New'),
                ],
              ),
            ),
          ),
          InkWell(onTap: () {}, child: FriendCard('Mitul')),
          FriendCard('Target Gadget'),
          FriendCard('Mama'),
          FriendCard('Atul'),
          FriendCard('Deepak'),
          FriendCard('Yashwant'),
          FriendCard('Aditya'),
        ],
      ),
    );
  }
}
