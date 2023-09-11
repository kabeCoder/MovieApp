// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:movie_app/core/service/base/data/models/api_result.dart';

abstract class BaseApiRepository {
  Future<ApiResult<T>> serviceCall<T>(Future<T> Function() callFunction) async {
    try {
      final result = await callFunction();
      return ApiResult(data: result, error: null);
    } catch (e) {
      return ApiResult(data: null, error: e.toString());
    }
  }

  // Future<ApiResult<List<T>>> apiCall<T>(
  //   Future<http.Response> Function() callFunction,
  //   T Function(dynamic) fromJson,
  // ) async {
  //   try {
  //     final response = await callFunction();

  //     if (response.statusCode == 200) {
  //       final List<dynamic> jsonData = json.decode(response.body);
  //       final data = jsonData.map((dynamic item) => fromJson(item)).toList();
  //       return ApiResult<List<T>>(data: data, error: null);
  //     } else {
  //       return ApiResult<List<T>>(data: [], error: 'HTTP Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error in API call: $e');
  //     return ApiResult<List<T>>(data: [], error: 'Network Error: $e');
  //   }
  // }
}
