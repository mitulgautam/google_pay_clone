import 'package:flutter/material.dart';

class AnonymousList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _list('ALL TRANSACTIONS', Icons.timelapse),
        _list('TEZ MODE TRANSACTIONS', Icons.av_timer),
        _list('CHECK BALANCE', Icons.home),
        Container(
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text('INVITE A FRIEND'),
            subtitle: Text("Get 51₹ after each friend's first payment"),
            contentPadding: EdgeInsets.only(top: 8.0, left: 16.0),
          ),
        ),
        SizedBox(
          height: 1.0,
        ),
      ],
    );
  }

  Widget _list(String title, IconData icon) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 1.0,
        ),
        Container(
          color: Colors.white,
          child: ListTile(
              contentPadding: EdgeInsets.only(top: 8.0, left: 16.0),
              leading: Icon(icon),
              title: Text(title)),
        ),
      ],
    );
  }
}
