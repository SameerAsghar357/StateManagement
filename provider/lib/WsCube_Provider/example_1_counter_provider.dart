import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  // CounterProvider({super.key});

  int _count = 0;

  //
  int getValue() => _count;

  // events
  void increment() {
    _count++;
    notifyListeners();
  }

  // events
  void decrement() {
    if (_count > 0) {
      _count--;
    }
    notifyListeners();
  }

}
