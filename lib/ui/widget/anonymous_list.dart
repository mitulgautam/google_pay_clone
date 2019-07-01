import 'package:flutter/material.dart';

class AnonymousList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _list('ALL TRANSACTIONS', Icons.timelapse),
          _list('TEZ MODE TRANSACTIONS', Icons.av_timer),
          _list('CHECK BALANCE', Icons.home),
          Container(
            height: 0.5,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 1.0),
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.black87,
              ),
              title: Text('INVITE A FRIEND'),
              subtitle: Text("Get 51₹ after each friend's first payment"),
              contentPadding: EdgeInsets.only(top: 8.0, left: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list(String title, IconData icon) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
        Container(
          color: Colors.white,
          child: ListTile(
              contentPadding: EdgeInsets.only(top: 8.0, left: 16.0),
              leading: Icon(
                icon,
                color: Colors.black87,
              ),
              title: Text(title)),
        ),
      ],
    );
  }
}
