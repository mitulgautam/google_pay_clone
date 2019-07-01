import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomepageModel extends ChangeNotifier {
  double _opacity = 1;
  ScrollController _scrollController = ScrollController();
  double _offset;
  bool _tezOn = false; //for testing switch back to false after complete
  bool _scrollNotifi = false;
  bool _dataAcceptPay = false;
  bool _dataAcceptReceive = false;

  bool get dataAcceptPay => _dataAcceptPay;

  set dataAcceptPay(bool value) {
    _dataAcceptPay = value;
    notifyListeners();
  }

  bool get scrollNotifi => _scrollNotifi;

  set scrollNotifi(bool value) {
    _scrollNotifi = value;
    notifyListeners();
  }

  double get offset => _offset;
  double _sliderPos = 0;

  double get sliderPos => _sliderPos;

  set sliderPos(double value) {
    _sliderPos = value;
    notifyListeners();
  }

  bool get tezOn => _tezOn;

  set tezOn(bool value) {
    _tezOn = value;
    notifyListeners();
  }

  HomepageModel() {
    initListener();
  }

  set offset(double value) {
    _offset = value;
    notifyListeners();
  }

  double get opacity => _opacity;

  set opacity(double value) {
    _opacity = value;
    notifyListeners();
  }

  initListener() {
    scrollController.addListener(listener);
  }

  listener() {
    if (opacity > .3 &&
        scrollController.offset < 300 &&
        scrollController.offset >= 0)
      opacity = 1 - scrollController.offset / 580;
    sliderPos = (scrollController.offset / 507 * 1.2);
    print(scrollController.offset);
    if (scrollController.offset < 250 && scrollNotifi == true) {
      scrollController
          .animateTo(500,
              duration: Duration(milliseconds: 300), curve: Curves.decelerate)
          .whenComplete(() {
        print("Anim");
      });
    }
  }

  ScrollController get scrollController => _scrollController;

  bool get dataAcceptReceive => _dataAcceptReceive;

  set dataAcceptReceive(bool value) {
    _dataAcceptReceive = value;
    notifyListeners();
  }
}
