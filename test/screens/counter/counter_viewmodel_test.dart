import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_test/screens/counter/counter_viewmodel.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';
import 'package:test/test.dart';

import 'counter_viewmodel_test.mocks.dart';

@GenerateMocks([CounterIncrement, CounterDecrement])
void main() {
  group('Counter ViewModel', () {
    test('Counter should increase', () async{
      final incrementClient = MockCounterIncrement();
      final decrementClient = MockCounterDecrement();
      when(incrementClient.call()).thenAnswer((_) async => 1);
      final counterVm = CounterViewModel(incrementClient, decrementClient);
      await counterVm.onIncrease();
      expect(counterVm.value, 1);
    });

    test('Counter should decrease', () {
      final incrementClient = MockCounterIncrement();
      final decrementClient = MockCounterDecrement();
      when(decrementClient.call()).thenAnswer((_) async => 0);
      final counterVm = CounterViewModel(incrementClient, decrementClient);
      counterVm.onDecrease();
      expect(counterVm.value, 0);
    });
  });
}
