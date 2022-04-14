import 'package:my_flutter_test/data/repositories/counter_repo_impl.dart';
import 'package:my_flutter_test/utils/custom_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('Counter Repository', () {
    test('angka should start at 0', () {
      expect(CounterRepoImpl().angka, 0);
    });

    test('Counter value should be incremented', () {
      final counter = CounterRepoImpl();
      counter.increment();
      expect(counter.angka, 1);
    });
    test('Counter value should be decremented', () {
      final counter = CounterRepoImpl(angka: 1);
      counter.decrement();
      expect(counter.angka, 0);
    });
    test('Counter value should throw exception when value is greater then 10',
        () {
      final counter = CounterRepoImpl(angka: 10);
      expect(() => counter.increment(), throwsA(isA<ValueException>()));
      expect(
          () => counter.increment(),
          throwsA(predicate((x) =>
              x is ValueException &&
              x.message == 'Can not be greater than 10')));
    });
    test('Counter value should throw exception when negative value', () {
      final counter = CounterRepoImpl();
      expect(() => counter.decrement(), throwsException);
    });
  });
}
