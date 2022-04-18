// Mocks generated by Mockito 5.1.0 from annotations
// in my_flutter_test/test/use_cases/counter_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:my_flutter_test/data/repositories/counter_repo.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [CounterRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockCounterRepo extends _i1.Mock implements _i2.CounterRepo {
  MockCounterRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> increment() =>
      (super.noSuchMethod(Invocation.method(#increment, []),
          returnValue: Future<int>.value(0)) as _i3.Future<int>);
  @override
  _i3.Future<int> decrement() =>
      (super.noSuchMethod(Invocation.method(#decrement, []),
          returnValue: Future<int>.value(0)) as _i3.Future<int>);
}
