import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nixler_demo/core/route/api_route.dart';

class EventRepository {
  final Dio? dio;
  EventRepository({required this.dio});

  Future fetchLiveMusic(String id) async {
    String path = ApiUrl.getEvent;
    try {
      final response = await dio?.get(path, queryParameters: {
        'city': 'Delhi',
        'category': id,
      });
      log('${response?.data.toString()}');
      return response?.data;
    } catch (e) {
      log('error in api $e');
      rethrow;
    }
  }
}
