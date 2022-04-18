import 'package:flutter/material.dart';
import 'package:my_flutter_test/app_config.dart';
import 'package:my_flutter_test/data/api/api_helper.dart';
import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/data/repositories/counter_repo_api_impl.dart';
import 'package:my_flutter_test/screens/counter/counter_screen.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await AppConfig.forEnvironment();
  runApp(MyApp(
    config: config,
  ));
}

class MyApp extends StatelessWidget {
  late AppConfig config;
  late CounterRepo repo;
  late CounterIncrement counterIncrement;
  late CounterDecrement counterDecrement;

  MyApp({Key? key, required this.config}) {
    final apiHelper = ApiHelper(client: config.httpClient);
    repo = CounterRepoApiImpl(apiHelper);
    counterIncrement = CounterIncrement(repo);
    counterDecrement = CounterDecrement(repo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildCounterScreen(),
    );
  }

  Widget _buildCounterScreen() {
    return CounterScreen(
        counterIncrement: counterIncrement, counterDecrement: counterDecrement);
  }
}
