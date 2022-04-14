import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/data/repositories/counter_repo_impl.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    test('angka should start at 0', () {
      expect(CounterRepoImpl().angka, 0);
    });

    test('Counter value should be incremented', () {
      final counter = CounterRepoImpl();
      counter.increment();
      expect(counter.angka, 1);
    });

    test('Counter value should be decremented', () {
      final counter = CounterRepoImpl();
      counter.decrement();
      expect(counter.angka, -1);
    });
  });
}
