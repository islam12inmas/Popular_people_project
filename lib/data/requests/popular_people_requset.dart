import 'dart:convert';
import 'dart:developer';

import 'package:course_task/data/global_methods/debuging_requsets.dart';
import 'package:course_task/data/global_methods/uri_parsing_method.dart';
import 'package:course_task/domain/models/popular_pepole_model.dart';
import 'package:http/http.dart' as http;

class PopularPeopleRequest {
  static void getPopularPeople(
      {required Function(List<Results>?) onSuccess,
      required Function(int error) onError}) async {
    var headers = {
      "Content-Type": "application/json",
    };
    await http
        .post(
      getUri(
          'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b'),
      headers: headers,
    )
        .then((response) {
      Map<String, dynamic> decoded;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        decoded = json.decode(response.body);
        if (decoded['results'] != null) {
          PopularPeopleModel result = PopularPeopleModel.fromJson(decoded);
          onSuccess(result.results);
        } else {
          onError(decoded['page']);
        }
      } else {
        onError(404);
      }
      debugApi(
          methodName: "getPopularPeople",
          statusCode: response.statusCode,
          response: response.body,
          data: null,
          endPoint: response.request!.url.toString(),
          headers: headers);
    }, onError: (error) {
      log("error happened from popular People ${error.toString()}");
      onError(error);
    });
  }
}
