import 'package:my_flutter_test/data/repositories/counter_repo.dart';

class CounterDecrement {
  final CounterRepo _repo;

  CounterDecrement(this._repo);

  int call() {
    return _repo.decrement();
  }
}
