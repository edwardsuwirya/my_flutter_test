import 'package:my_flutter_test/data/repositories/counter_repo.dart';

class CounterRepoImpl implements CounterRepo {
  int angka = 0;

  @override
  int increment() {
    angka++;
    return angka;
  }

  @override
  int decrement() {
    angka--;
    return angka;
  }
}
