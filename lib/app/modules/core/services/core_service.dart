import 'package:dio/dio.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/client.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';

Future<dynamic> request({
  dynamic body,
  required Function({String? error, String? type}) onError,
  required Function(List<dynamic>? data) onSuccess,
  required List<String> paths,
  required ERequestMethod method,
  Map<String, dynamic>? query,
  bool useCookie = true,
  String? errorType,
}) async {
  final Dio client = Dio();
  try {
    final Dio client = await coreClient();
    if (query != null) {
      client.options.queryParameters = query;
    }
    final List<Map> responses = [];
    for (final path in paths) {
      switch (method) {
        case ERequestMethod.get:
          final response = await client.get(path);
          responses.add(response.data);
          break;
        case ERequestMethod.post:
          final response = await client.post(path, data: body);
          responses.add(response.data);
          break;
        case ERequestMethod.patch:
          final response = await client.patch(path, data: body);
          responses.add(response.data);
          break;
        case ERequestMethod.delete:
          final response = await client.delete(path, data: body);
          responses.add(response.data);
          break;
      }
    }
    onSuccess(responses);
  } catch (e) {
    final errResponse = (e as DioError).response?.data;
    if (errResponse == null) {
      onError(error: e.error is String ? e.error : e.error.message, type: errorType);
    } else if (errResponse['type'] != null) {
      onError(error: errResponse['message'], type: 'token');
    } else {
      onError(error: errResponse['message'], type: errorType);
    }
  } finally {
    client.close();
  }
}
