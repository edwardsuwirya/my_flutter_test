import 'package:my_flutter_test/counter.dart';
import 'package:test/test.dart';

void main() {
  test('Counter valie should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.angka, 1);
  });
}
