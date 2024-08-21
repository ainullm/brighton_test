import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import 'dart:developer' as dev;

import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_pages.dart';
import '../constant/constants.dart';
import '../constant/custom_dio.dart';

class DioClient {
  DioClient(this._baseUrl);

  final String _baseUrl;

  Dio create() {
    return CustomDio(_baseUrl).create()..interceptors.addAll([ApiInterceptor()]);
  }
}

class ApiInterceptor extends Interceptor {
  final int retries = 1;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final packageInfo = await PackageInfo.fromPlatform();

    String? platform;
    if (Platform.isAndroid) {
      platform = 'android';
    } else if (Platform.isIOS) {
      platform = 'ios';
    }

    options.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-client-id': packageInfo.packageName,
      'x-client-version': packageInfo.version,
    });

    if (platform != null) {
      options.headers.putIfAbsent('x-client-platform', () => platform);
    }


    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {

      Get.toNamed(Routes.NAVIGATION);
      return super.onError(err, handler);
    }

    final attempt = err.requestOptions._retryAttempt + 1;
    if (attempt > retries) return super.onError(err, handler);

    try {
      final dio = const CustomDio(API_BASE_URL).create();
      final pref = await SharedPreferences.getInstance();
      var refreshToken = pref.get(KEY_REFRESH_TOKEN);
      if (refreshToken == null) return super.onError(err, handler);
      dio.options.headers['Authorization'] = 'Bearer $refreshToken';
      final response = await dio.get('/auth/refresh-token');

      if (response.statusCode == 200) {
        String accessToken = response.data?['data'][KEY_ACCESS_TOKEN];
        String refreshToken = response.data?['data'][KEY_REFRESH_TOKEN];
        await pref.setString(KEY_ACCESS_TOKEN, accessToken);
        await pref.setString(KEY_REFRESH_TOKEN, refreshToken);

        final options = err.requestOptions..headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
        final newResponse = await dio.fetch<void>(options);
        return handler.resolve(newResponse);
      }
    } on DioException catch (e) {
      dev.log('ApiInterceptor, error refresh token: ${e.response?.statusCode} ${e.response}');
    }

    super.onError(err, handler);
  }
}

extension AuthRequestOptionsX on RequestOptions {
  int get _retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;
  set _retryAttempt(final int attempt) => extra['auth_retry_attempt'] = attempt;
}
