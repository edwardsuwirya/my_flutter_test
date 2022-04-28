import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_test/ioc.dart';
import 'package:my_flutter_test/screens/counter/counter_screen.dart';
import 'package:my_flutter_test/screens/counter/counter_viewmodel.dart';
import 'package:my_flutter_test/use_cases/counter_decrement.dart';
import 'package:my_flutter_test/use_cases/counter_increment.dart';
import 'package:my_flutter_test/utils/custom_exceptions.dart';

import 'counter_viewmodel_test.mocks.dart';

void main() {
  late CounterIncrement incrementClient;
  late CounterDecrement decrementClient;
  setUpAll(() {
    incrementClient = MockCounterIncrement();
    decrementClient = MockCounterDecrement();
    getIt.registerFactory(
        () => CounterViewModel(incrementClient, decrementClient));
  });
  testWidgets('Counter Widget has label value and 2 button counter',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(),
    ));
    final valueFinder = find.text('0');
    final buttonIncrementFinder = find.text('+');
    final buttonDecrementFinder = find.text('-');
    expect(valueFinder, findsOneWidget);
    expect(buttonIncrementFinder, findsOneWidget);
    expect(buttonDecrementFinder, findsOneWidget);
  });

  testWidgets('Counter Increment Button Widget', (WidgetTester tester) async {
    when(incrementClient()).thenAnswer((_) async => 1);
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(),
    ));

    final buttonIncrementFinder = find.text('+');
    await tester.tap(buttonIncrementFinder);
    await tester.pump();
    final valueFinder = find.text('1');
    expect(valueFinder, findsOneWidget);
  });
  testWidgets('Counter Increment Button Widget throws error',
      (WidgetTester tester) async {
    when(incrementClient()).thenThrow(ValueException(message: 'error'));
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(),
    ));

    final buttonIncrementFinder = find.text('+');
    await tester.tap(buttonIncrementFinder);
    await tester.pump();
    final valueFinder = find.text('0');
    expect(valueFinder, findsOneWidget);

    final messageFinder = find.text('error');
    expect(messageFinder, findsOneWidget);
  });
}
