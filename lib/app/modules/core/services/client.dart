import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

Future<Dio> coreClient() async {
  final Dio client = Dio();
  client.options.baseUrl = 'http://localhost:4000/';
  client.options.connectTimeout = 15000;
  client.options.receiveTimeout = 60000;

  final Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  final cj = PersistCookieJar(
    storage: FileStorage('$appDocPath/.cookies/'),
  );
  client.interceptors.add(
    CookieManager(cj),
  );
  return client;
}
