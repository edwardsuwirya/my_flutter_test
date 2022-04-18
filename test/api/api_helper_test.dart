import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:my_flutter_test/data/api/api_helper.dart';

void main() {
  group('API helper', () {
    final Dio dio = Dio();
    late DioAdapter dioAdapter;
    setUp(() {
      dioAdapter = DioAdapter(dio: dio);
    });
    test('POST', () {});
    test('GET Success', () async {
      dioAdapter.onGet(
        "/dummy",
        (request) =>
            request.reply(200, {"status": "00", "message": "ok", "data": 1}),
      );

      final apiHelper = ApiHelper(client: dio);
      final result = await apiHelper.getData("/dummy");
      expect(result.data, 1);
    });
    test('GET Failed', () {
      dioAdapter.onGet(
        "/dummy",
        (request) => request.reply(401, null),
      );

      final apiHelper = ApiHelper(client: dio);
      expect(() async => await apiHelper.getData("/dummy"), throwsException);
    });
  });
}
