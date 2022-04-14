import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';
import 'package:test/test.dart';

import 'counter_repo_test.mocks.dart';


/*
1. Install package mockito + build_runner
...
dev_dependencies:
  flutter_test:
    sdk: flutter
  test:
  mockito:
  build_runner:
...

2. Lakukan generate class mock dengan menjalankan perintah
flutter pub run build_runner build


 */

@GenerateMocks([CounterRepo])
void main() {
  group('Counter Use Case', () {
    test('Counter Increment Use Case should be called ', () {
      final client = MockCounterRepo();
      when(client.increment()).thenReturn(100);
      final counterIncrementUseCase = CounterIncrement(client);
      final actual = counterIncrementUseCase();
      expect(actual, 100);
    });

    test('Counter Decrement Use Case should be called successfully', () {
      final client = MockCounterRepo();
      when(client.decrement()).thenReturn(-9);
      final counterDecrementUseCase = CounterDecrement(client);
      final actual = counterDecrementUseCase();
      expect(actual, -9);
    });
  });
}
