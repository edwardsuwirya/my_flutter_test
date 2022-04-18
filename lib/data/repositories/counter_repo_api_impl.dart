import 'package:my_flutter_test/data/api/api_helper.dart';
import 'package:my_flutter_test/data/api/api_path.dart';
import 'package:my_flutter_test/data/repositories/counter_repo.dart';

class CounterRepoApiImpl implements CounterRepo {
  late final apiHelper;

  CounterRepoApiImpl(ApiHelper helper) {
    apiHelper = helper;
  }

  @override
  Future<int> decrement() async {
    final result = await apiHelper.getData(apiDecrement);
    return result.data;
  }

  @override
  Future<int> increment() async {
    final result = await apiHelper.getData(apiIncrement);
    return result.data;
  }
}
