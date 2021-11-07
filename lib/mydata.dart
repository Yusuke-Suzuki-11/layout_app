import 'package:flutter/material.dart';

class MyData extends ChangeNotifier{
  double _value = 0.5;
  
  double get value => _value;
  
  set value(double value){
    _value = value;
    notifyListeners();
  }
}