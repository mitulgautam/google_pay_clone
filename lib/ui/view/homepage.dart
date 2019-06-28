import 'package:flutter/material.dart';
import 'package:google_pay_clone/core/viewmodel/homepage_viewmodel.dart';
import 'package:google_pay_clone/resources/color_scheme.dart';
import 'package:google_pay_clone/resources/screen_utils.dart';
import 'package:google_pay_clone/ui/widget/anonymous_list.dart';
import 'package:google_pay_clone/ui/widget/business_section.dart';
import 'package:google_pay_clone/ui/widget/friend_section.dart';
import 'package:google_pay_clone/ui/widget/gpay_flare.dart';
import 'package:google_pay_clone/ui/widget/promotion_section.dart';
import 'package:google_pay_clone/ui/widget/tap_pay.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

ScreenUtil util;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    util = ScreenUtil(MediaQuery.of(context).size);
    return ChangeNotifierProvider<HomepageModel>(
      builder: (_) => HomepageModel(),
      child: Consumer<HomepageModel>(
        builder: (context, model, _) => Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: <Widget>[
                  NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        print("Started");
                        model.scrollNotifi == false;
                      } else if (scrollNotification
                          is ScrollUpdateNotification) {
                        print("Updating");
                      } else if (scrollNotification is ScrollEndNotification) {
                        model.scrollNotifi == true;
                        print("End");
                      }
                    },
                    child: CustomScrollView(
                      controller: model.scrollController,
                      reverse: false,
                      slivers: <Widget>[
                        SliverAppBar(
                          pinned: true,
                          elevation: 0.0,
                          expandedHeight: util.size.height / 10 * 6.5,
                          backgroundColor: ColorsScheme.gPayBlue,
                          leading: model.tezOn == true
                              ? Container()
                              : AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/profile.jpeg'),
                                          borderRadius: BorderRadius.circular(
                                              util.size.height / 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          title: model.tezOn == true
                              ? Container()
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Mitul Gautam'),
                                    Text(
                                      'mitulgautamofficial@gmail.com',
                                      style: TextStyle(fontSize: 12.0),
                                    )
                                  ],
                                ),
                          actions: <Widget>[
                            model.tezOn == true
                                ? Container()
                                : InkWell(
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
                                  ),
                          ],
                          flexibleSpace: FlexibleSpaceBar(
                            background: Align(
                              alignment: Alignment.center,
                              child: TapPay(model),
                            ),
                            collapseMode: CollapseMode.none,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  color: ColorsScheme.gPayBlue,
                                  height: model.tezOn == true
                                      ? util.size.height / 10 * 5
                                      : 1.0),
                              Container(
                                child: Flr(),
                                width: util.size.width,
                                height: util.size.width / 11,
                              ), //flares
                              FriendSection(), //friend
                              BusinessSection(), //business
                              PromotionSection(), //promotions
                              AnonymousList(), //list
                              Image.asset('assets/bottom.png')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //stack animation for bottom
                  model.tezOn == true
                      ? AnimatedContainer(
                          alignment: Alignment.bottomCenter,
                          curve: Curves.linear,
                          height: util.size.height,
                          duration: Duration(seconds: 2),
                          child: Container(
                              height: util.size.height / 16,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Transform.rotate(
                                            angle: math.pi / 2,
                                            child: Icon(Icons.filter_list)),
                                        Text('Tez Mode'),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_up)
                                ],
                              )))
                      : Container()
                ],
              ),
            ),
      ),
    );
  }
}
