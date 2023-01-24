import 'dart:convert';

import 'package:course_task/data/global_methods/debuging_requsets.dart';
import 'package:course_task/domain/models/popular_people_data_model.dart';

import '../../domain/models/popular_people_images_model.dart';
import '../../domain/models/popular_pepole_model.dart';
import 'package:http/http.dart' as http;

import '../global_methods/uri_parsing_method.dart';

class PopularPeopleDataRequest {
  static void getPopularPeopleData(
      {int? id,
      required Function(PopularPeopleDataModel) onSuccess,
      required Function(int error) onError}) async {
    var headers = {"Content-Type": "application/json"};
    await http
        .get(
            getUri(
                "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"),
            headers: headers)
        .then((response) {
      Map<String, dynamic> decoded;

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        decoded = json.decode(response.body);
        if (response.statusCode == 200) {
          PopularPeopleDataModel data =
              PopularPeopleDataModel.fromJson(decoded);
          onSuccess(data);
          onError(404);
        }

      }
      debugApi(
          methodName: "getPopularPeopledetails",
          statusCode: response.statusCode,
          response: response.body,
          data: null,
          endPoint: response.request!.url.toString(),
          headers: headers);
    });
  }
}
