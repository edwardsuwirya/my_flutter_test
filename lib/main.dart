import 'package:flutter/material.dart';
import 'package:my_flutter_test/data/repositories/counter_repo.dart';
import 'package:my_flutter_test/data/repositories/counter_repo_impl.dart';
import 'package:my_flutter_test/screens/counter/counter_screen.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    final CounterRepo repo = CounterRepoImpl();
    final counterIncrement = CounterIncrement(repo);
    final counterDecrement = CounterDecrement(repo);
    return CounterScreen(
        counterIncrement: counterIncrement, counterDecrement: counterDecrement);
  }
}
