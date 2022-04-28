import 'package:flutter/material.dart';
import 'package:my_flutter_test/screens/counter/counter_screen.dart';

import 'ioc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.allReady();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
    return CounterScreen();
  }
}
