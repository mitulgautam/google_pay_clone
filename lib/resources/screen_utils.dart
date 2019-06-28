import 'package:flutter/material.dart';

class ScreenUtil {
  Size _size;

  ScreenUtil(this._size);

  // ignore: unnecessary_getters_setters
  Size get size => _size;

  // ignore: unnecessary_getters_setters
  set size(Size value) {
    _size = value;
  }
}
