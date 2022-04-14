import 'package:flutter/foundation.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';

class CounterViewModel with ChangeNotifier {
  final CounterIncrement _counterIncrement;
  final CounterDecrement _counterDecrement;

  int? _currentValue;

  int? get currentValue => _currentValue;

  CounterViewModel(this._counterIncrement, this._counterDecrement) {
    _currentValue = 0;
  }

  void onIncrease() {
    final res = _counterIncrement();
    _currentValue = res;
    notifyListeners();
  }

  void onDecrease() {
    final res = _counterDecrement();
    _currentValue = res;
    notifyListeners();
  }
}
