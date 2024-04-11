// Single Source of Truth
// Whether you use ChangeNotifier or ValueNotifier, this approach is about having a single source of truth.
// With the ChangeNotifier, we made the data private so that nobody could modify it outside the ChangeNotifier.
// Data can only change for either by using the functions defined within.

import 'package:flutter/material.dart';

class CoreState with ChangeNotifier {
  int _counter = 0;
  Color _backgroundColor = Colors.green;

  int get counter => _counter;
  Color get backgroundColor => _backgroundColor;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void setColor(Color backgroundColor) {
    if (_backgroundColor != backgroundColor) {
      _backgroundColor = backgroundColor;
      notifyListeners();
    }
  }

  void setCounter(int counter) {
    if (_counter != counter) {
      _counter = counter;
      notifyListeners();
    }
  }

  // this is not needed in this case
  // @override
  // bool operator ==(covariant CoreState other) =>
  //     identical(this, other) ||
  //     runtimeType == other.runtimeType &&
  //         counter == other.counter &&
  //         backgroundColor == other.backgroundColor;

  // @override
  // int get hashCode => counter.hashCode ^ backgroundColor.hashCode;
}
