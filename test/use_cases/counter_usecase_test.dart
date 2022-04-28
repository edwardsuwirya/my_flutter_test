import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/ioc.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';

import 'counter_usecase_test.mocks.dart';

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

class MyCounterRepoMock implements CounterRepo{
  @override
  Future<int> decrement() {
    return Future.value(10);
  }

  @override
  Future<int> increment() {
    return Future.value(1);
  }

}
@GenerateMocks([CounterRepo])
void main() {
  setUpAll((){
    getIt.registerFactory<CounterRepo>(() => MyCounterRepoMock());
  });
  group('Counter Use Case', () {
    test('Counter Increment Use Case should be called ', () async {
      final client = MockCounterRepo();
      when(client.increment()).thenAnswer((_) async => 100);
      final counterIncrementUseCase = CounterIncrement(client);
      final actual = await counterIncrementUseCase();
      expect(actual, 100);
    });

    test('Counter Decrement Use Case should be called successfully', () async {
      final client = MockCounterRepo();
      when(client.decrement()).thenAnswer((_) async => -9);
      final counterDecrementUseCase = CounterDecrement(client);
      final actual = await counterDecrementUseCase();
      expect(actual, -9);
    });

    test('Counter Decrement Use Case should be called successfully (with getit)', () async {
      final counterDecrementUseCase = CounterDecrement(getIt<CounterRepo>());
      final actual = await counterDecrementUseCase();
      expect(actual, 10);
    });
  });
}
