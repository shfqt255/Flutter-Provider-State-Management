import 'package:flutter/material.dart';

class provider extends ChangeNotifier {
  int _count = 0;
  int get() => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
