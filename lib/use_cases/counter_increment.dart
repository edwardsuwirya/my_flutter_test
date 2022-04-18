import 'package:my_flutter_test/data/repositories/counter_repo.dart';

class CounterIncrement {
  final CounterRepo _repo;

  CounterIncrement(this._repo);

  Future<int> call() {
    return _repo.increment();
  }
}
