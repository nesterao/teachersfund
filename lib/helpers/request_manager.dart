import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:teachersfund/helpers/extension_methods.dart';

import 'app_utils.dart';

class RequestManager extends GetConnect {
  void _checkErrorGl(GraphQLResponse response) {
    var error = response.graphQLErrors?.map((e) => e.message).join(" ");
    logInfo(error);
    if (error != null) throw HttpException(error);
  }

  void _checkError(Response response) {
    logInfo(response.statusText);
    logInfo(response.body ?? "no error body found ...");
    logInfo(response);

    final HttpStatus status = response.status;
    final String errorCode =
        'Code ${response.statusCode}: ${response.statusText}';
    if (response.statusText!.containsIgnoreCase('HandshakeException')) {
      throw const HandshakeException('Unable to reach server, retry shortly');
    } else if (status.connectionError ||
        response.statusText!.containsIgnoreCase('SocketException')) {
      throw const SocketException('Slow or no internet detected');
    } else if (status.isUnauthorized) {
      throw HttpException('Not authorized to make request.\n$errorCode');
    } else if (status.isForbidden) {
      throw HttpException('Not allowed to make request.\n$errorCode');
    } else if (status.isNotFound) {
      throw HttpException('Unable to access requested resource.\n$errorCode');
    } else if (status.isServerError) {
      throw HttpException('Unable to handle requested resource.\n$errorCode');
    } /*else {
      throw Exception('Sorry, something went wrong.\n$errorCode');
    }*/
  }

  Future<dynamic> sendGetRequest(String url,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    super.timeout = const Duration(minutes: 1);
    final response = await super.get(url, headers: headers, query: query);
    if (!response.isOk) _checkError(response);
    return response.body;
  }

  Future<dynamic> sendPostRequest(String url, Object? body,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    super.timeout = const Duration(minutes: 1);
    final response =
        await super.post(url, body, headers: headers, query: query);
    if (!response.isOk) _checkError(response);
    return response.body;
  }

  Future<dynamic> sendGraphQLQuery(String url, String graphQLQuery,
      {Map<String, String>? headers, Map<String, dynamic>? values}) async {
    super.timeout = const Duration(minutes: 1);
    final response = await super
        .query(graphQLQuery, url: url, headers: headers, variables: values);
    if (!response.isOk) _checkErrorGl(response);
    return (response.body as Map).values.first;
  }

  Future<dynamic> sendGraphQLMutation(String url, String graphQLMutation,
      {Map<String, String>? headers, Map<String, dynamic>? values}) async {
    super.timeout = const Duration(minutes: 1);
    final response = await super.mutation(graphQLMutation,
        url: url, headers: headers, variables: values);
    if (!response.isOk) _checkErrorGl(response);
    return (response.body as Map).values.first;
  }
}
