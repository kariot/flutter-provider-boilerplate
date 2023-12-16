import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/di/injection.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/navigation/navigation_utils.dart';
import 'package:provider_template/navigation/route_constants.dart';

mixin BaseRepo {
  Future<Either<ApiFailure, E>> post<E>(
    String url,
    Map<String, dynamic> body,
    E Function(Object?) fromJsonE,
    String Function(Map<String, dynamic>?) readAPIError,
  ) async {
    return sendRequest<E>(
        url, body, fromJsonE, readAPIError, null, RequestType.POST);
  }

  Future<Either<ApiFailure, E>> put<E>(
    String url,
    dynamic body,
    E Function(Object?) fromJsonE,
    Map<String, String> header,
    String Function(Map<String, dynamic>?) readAPIError,
  ) async {
    return sendRequest<E>(
        url, body, fromJsonE, readAPIError, header, RequestType.PUT);
  }

  Future<Either<ApiFailure, E>> patch<E>(
    String url,
    Map<String, dynamic> body,
    E Function(Object?) fromJsonE,
    String Function(Map<String, dynamic>?) readAPIError,
  ) async {
    return sendRequest<E>(
        url, body, fromJsonE, readAPIError, null, RequestType.PATCH);
  }

  Future<Either<ApiFailure, E>> get<E>(
      String url,
      E Function(Object?) fromJsonE,
      String Function(Map<String, dynamic>?) readAPIError) async {
    debugPrint('Requesting to $url');
    return sendRequest<E>(
        url, null, fromJsonE, readAPIError, null, RequestType.GET);
  }

  Future<Map<String, String>> _getHeader() async {
    final token = await getIt<ISharedPref>().getAccessToken();
    Map<String, String> map = {'content-type': 'application/json'};
    if (token.isNotEmpty) {
      map['Authorization'] = 'Bearer $token';
    }
    return map;
  }

  Future<Either<ApiFailure, E>> sendRequest<E>(
      String url,
      dynamic body,
      E Function(Object?) fromJsonE,
      String Function(Map<String, dynamic>?) readAPIError,
      Map<String, String>? _header,
      RequestType type) async {
    debugPrint('Requesting to $url');
    debugPrint('Request body ${body.toString()}');
    final header = _header ?? await _getHeader();
    try {
      var response = switch (type) {
        RequestType.GET => await http.get(Uri.parse(url), headers: header),
        RequestType.POST => await http.post(Uri.parse(url),
            body: jsonEncode(body), headers: header),
        RequestType.PATCH => await http.patch(Uri.parse(url),
            body: jsonEncode(body), headers: header),
        RequestType.PUT => await http.put(Uri.parse(url),
            body: jsonEncode(body), headers: header),
      };
      debugPrint(response.statusCode.toString());
      Map<String, dynamic>? decodedJson =
          response.body.isNotEmpty ? jsonDecode(response.body) : null;
      debugPrint('Response ${decodedJson?.toString()}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseObj = fromJsonE(decodedJson);
        return Right(responseObj);
      } else if (response.statusCode == 401) {
        NavigationUtils.navKey.currentState
            ?.pushNamedAndRemoveUntil(RouteConstansts.root, (route) => false);
        return const Left(ApiFailure.serverError(message: 'Session expired'));
      } else {
        return Left(ApiFailure.serverError(message: readAPIError(decodedJson)));
      }
    } catch (e) {
      debugPrint('<>e :${e.toString()}');
      if (e is SocketException) {
        return const Left(
            ApiFailure.clientError(message: 'Failed to connect to sever.'));
      }
      return const Left(
          ApiFailure.clientError(message: 'An unknown error occured.!'));
    }
  }
}

enum RequestType { POST, PATCH, GET, PUT }
