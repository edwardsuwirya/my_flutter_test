import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_test/screens/counter/counter_screen.dart';
import 'package:my_flutter_test/utils/custom_exceptions.dart';

import 'counter_viewmodel_test.mocks.dart';

void main() {
  testWidgets('Counter Widget has label value and 2 button counter',
      (WidgetTester tester) async {
    final incrementClient = MockCounterIncrement();
    final decrementClient = MockCounterDecrement();
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(
          counterIncrement: incrementClient, counterDecrement: decrementClient),
    ));
    final valueFinder = find.text('0');
    final buttonIncrementFinder = find.text('+');
    final buttonDecrementFinder = find.text('-');
    expect(valueFinder, findsOneWidget);
    expect(buttonIncrementFinder, findsOneWidget);
    expect(buttonDecrementFinder, findsOneWidget);
  });

  testWidgets('Counter Increment Button Widget', (WidgetTester tester) async {
    final incrementClient = MockCounterIncrement();
    final decrementClient = MockCounterDecrement();
    when(incrementClient.call()).thenReturn(1);
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(
          counterIncrement: incrementClient, counterDecrement: decrementClient),
    ));

    final buttonIncrementFinder = find.text('+');
    await tester.tap(buttonIncrementFinder);
    await tester.pump();
    final valueFinder = find.text('1');
    expect(valueFinder, findsOneWidget);
  });
  testWidgets('Counter Increment Button Widget throws error',
      (WidgetTester tester) async {
    final incrementClient = MockCounterIncrement();
    final decrementClient = MockCounterDecrement();
    when(incrementClient.call()).thenThrow(ValueException(message: 'error'));
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(
          counterIncrement: incrementClient, counterDecrement: decrementClient),
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
