import 'package:get_it/get_it.dart';
import 'package:my_flutter_test/app_config.dart';
import 'package:my_flutter_test/data/api/api_helper.dart';
import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/data/repositories/counter_repo_api_impl.dart';
import 'package:my_flutter_test/data/repositories/counter_repo_impl.dart';
import 'package:my_flutter_test/screens/counter/counter_viewmodel.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';

//GetIt Instance
final getIt = GetIt.instance;

// Service Locator Container
void configureDependencies() {
  getIt.registerSingletonAsync<AppConfig>(() async {
    final config = await AppConfig.forEnvironment();
    return config;
  });

  getIt.registerSingletonWithDependencies<ApiHelper>(
      () => ApiHelper(client: getIt.get<AppConfig>().httpClient),
      dependsOn: [AppConfig]);

  getIt.registerFactory<CounterRepo>(() => CounterRepoImpl(),
      instanceName: 'CounterRepo');
  getIt.registerFactory<CounterRepo>(
      () => CounterRepoApiImpl(getIt<ApiHelper>()),
      instanceName: 'CounterApiRepo');
  getIt.registerFactory<CounterIncrement>(() =>
      CounterIncrement(getIt<CounterRepo>(instanceName: 'CounterApiRepo')));
  getIt.registerFactory<CounterDecrement>(() =>
      CounterDecrement(getIt<CounterRepo>(instanceName: 'CounterApiRepo')));

  getIt.registerFactory<CounterViewModel>(() =>
      CounterViewModel(getIt<CounterIncrement>(), getIt<CounterDecrement>()));
}
