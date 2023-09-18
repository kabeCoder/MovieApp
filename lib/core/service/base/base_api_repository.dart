// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/core/service/base/data/models/api_result.dart';

abstract class BaseApiRepository {
  // Future<ApiResult<T>> serviceCall<T>(Future<T> Function() callFunction) async {
  //   try {
  //     final result = await callFunction();
  //     return ApiResult(data: result, error: null);
  //   } catch (e) {
  //     return ApiResult(data: null, error: e.toString());
  //   }
  // }

  // For Mobile,Web,Mac OS, Windows - use internet_connection_checker_plus
  Future<ApiResult<T>> serviceCall<T>(Future<T> Function() callFunction) async {
    final connectivityResult = await InternetConnection().hasInternetAccess;
    if (connectivityResult == false) {
      return ApiResult(data: null, error: 'No internet connection');
    } else {
      try {
        final result = await callFunction();
        return ApiResult(data: result, error: null);
      } catch (e) {
        return ApiResult(data: null, error: e.toString());
      }
    }
  }
  // For Mobile,Mac OS - use internet_connection_checker
  // Future<ApiResult<T>> serviceCall<T>(Future<T> Function() callFunction) async {
  //   final connectivityResult = await InternetConnectionChecker().hasConnection;
  //   if (connectivityResult == false) {
  //     return ApiResult(data: null, error: 'No internet connection');
  //   } else {
  //     try {
  //       final result = await callFunction();
  //       return ApiResult(data: result, error: null);
  //     } catch (e) {
  //       return ApiResult(data: null, error: e.toString());
  //     }
  //   }
  // }

//   Future<ApiResult<T>> serviceCall<T>(Future<T> Function() callFunction) async {
//   final connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.none) {
//     return ApiResult(data: null, error: 'No internet connection');
//   }

//   try {
//     final result = await callFunction();
//     return ApiResult(data: result, error: null);
//   } catch (e) {
//     return ApiResult(data: null, error: e.toString());
//   }
// }

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
