import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:my_flutter_test/data/api/api_helper.dart';
import 'package:my_flutter_test/data/api/api_path.dart';
import 'package:my_flutter_test/data/repositories/counter_repo_api_impl.dart';
import 'package:test/test.dart';

void main() {
  group('Counter Repository API', () {
    final Dio dio = Dio();
    late ApiHelper apiHelper;
    late DioAdapter dioAdapter;
    setUp(() {
      dioAdapter = DioAdapter(dio: dio);
      apiHelper = ApiHelper(client: dio);
    });

    test('Counter value should be incremented', () async {
      dioAdapter.onGet(
        apiIncrement,
        (request) =>
            request.reply(200, {"status": "00", "message": "ok", "data": 1}),
      );

      final counter = CounterRepoApiImpl(apiHelper);
      final result = await counter.increment();
      expect(result, 1);
    });
    test('Counter value should throw', () async {
      dioAdapter.onGet(
        apiIncrement,
        (request) => request.reply(500, null),
      );

      final counter = CounterRepoApiImpl(apiHelper);
      expect(() async => await counter.increment(), throwsException);
    });
    test('Counter value should be decremented', () async {
      dioAdapter.onGet(
        apiDecrement,
        (request) =>
            request.reply(200, {"status": "00", "message": "ok", "data": 0}),
      );
      final counter = CounterRepoApiImpl(apiHelper);
      final result = await counter.decrement();
      expect(result, 0);
    });
  });
}
