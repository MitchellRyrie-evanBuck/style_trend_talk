import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get getIndex => _currentIndex;

  void setCurrentIndex(i) {
    _currentIndex = i;
    notifyListeners();
  }
}
