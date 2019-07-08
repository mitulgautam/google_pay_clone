import 'package:flutter/material.dart';
import 'package:google_pay_clone/ui/view/homepage.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 128.0, right: 128.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1024 / 768,
            child: SplashScreen.navigate(
              name: 'assets/aeologo.flr',
              next: HomePage(),
              until: () => Future.delayed(Duration(seconds: 3)),
              startAnimation: 'Untitled',
            ),
          ),
        ),
      ),
    );
  }
}
