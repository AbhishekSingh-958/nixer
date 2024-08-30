import 'package:dio/dio.dart';
import 'package:nixler_demo/core/localDb/sharedPrefs/preferences.dart';

import 'api_exception_handler.dart';

class DioUtil {
  Dio? _instance;
  Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  Dio createDioInstance() {
    var dio = Dio();
    dio.interceptors.clear();
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            PreferencesManager prefs = PreferencesManager();
            //final prefs = getIt<SharedPreferences>();
            // final token = prefs.getString(PreferenceKey.accessToken);
            String token =
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NjRjZTFmN2I0MWRkYTMyZTg1MzQ1Y2EiLCJpYXQiOjE3MjUwMDk3NjEsImV4cCI6MTcyODQ2NTc2MSwidHlwZSI6ImFjY2VzcyJ9.TQVl9v1Q2oTah3TJczNuNLhj6F1qk5I-sgWU9atYVSI';
            options.headers = {"Authorization":'Bearer $token'};
            return handler.next(options); //modify your request
          },
          onResponse: (response, handler) {
            ///custom exception handling as API gives 200 in all calls
            if ((response.data as Map<String, dynamic>?)?['success'] == false) {
              throw ApiException.fromJson(response);
            }
            return handler.next(response);
          },
          onError: (DioException e, handler) async {
           handler.next(e);
          },
        ),
      );
  }
}
