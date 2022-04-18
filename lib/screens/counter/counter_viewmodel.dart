import 'package:flutter/foundation.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';
import 'package:my_flutter_test/utils/screen_state.dart' as appstate;

class CounterViewModel with ChangeNotifier {
  final CounterIncrement _counterIncrement;
  final CounterDecrement _counterDecrement;

  late int value;
  late appstate.ScreenState _currentValue;

  appstate.ScreenState get currentValue => _currentValue;

  CounterViewModel(this._counterIncrement, this._counterDecrement) {
    value = 0;
    _currentValue = appstate.idle<int>(data: value);
  }

  Future<void> onIncrease() async {
    _currentValue = appstate.loading();
    notifyListeners();
    try {
      final res = await _counterIncrement();
      _currentValue = appstate.success<int>(res);
      value = _currentValue.data;
      notifyListeners();
    } catch (e) {
      print(e);
      _currentValue = appstate.fail(e.toString());
      notifyListeners();
    }
  }

  Future<void> onDecrease() async {
    _currentValue = appstate.loading();
    notifyListeners();
    try {
      final res = await _counterDecrement();
      _currentValue = appstate.success<int>(res);
      value = _currentValue.data;
      notifyListeners();
    } catch (e) {
      print(e);
      _currentValue = appstate.fail(e.toString());
      notifyListeners();
    }
  }
}
