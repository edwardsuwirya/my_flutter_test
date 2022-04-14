import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/utils/custom_exceptions.dart';

class CounterRepoImpl implements CounterRepo {
  int angka;

  CounterRepoImpl({this.angka = 0});

  @override
  int increment() {
    if (angka >= 10) {
      throw ValueException(message: 'Can not be greater than 10');
    }
    angka++;
    return angka;
  }

  @override
  int decrement() {
    if (angka == 0) {
      throw Exception('Negatif value');
    }
    angka--;
    return angka;
  }
}
