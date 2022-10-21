import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<Uint8List> byteResponse(String url) async {
  final Dio client = Dio();
  client.options.responseType = ResponseType.bytes;
  final response = await client.get(url);
  return response.data;
}
