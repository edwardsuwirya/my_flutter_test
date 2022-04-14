import 'package:my_flutter_test/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter',(){
    test('angka should start at 0', () {
      expect(Counter().angka, 0);
    });

    test('Counter value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.angka, 1);
    });

    test('Counter value should be decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.angka, -1);
    });
  });

}
