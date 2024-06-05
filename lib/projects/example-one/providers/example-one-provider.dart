import 'package:flutter/material.dart';

class ExampleOneProvider extends ChangeNotifier {
  double _sliderVal = 0.1;

  double get sliderVal => _sliderVal;

  set sliderVal(double val) {
    _sliderVal = val;
    notifyListeners();
  }
}
