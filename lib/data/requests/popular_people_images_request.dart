import 'dart:convert';

import '../../domain/models/popular_people_images_model.dart';
import '../../domain/models/popular_pepole_model.dart';
import 'package:http/http.dart' as http;

import '../global_methods/uri_parsing_method.dart';

class PopularPeopleImagesRequest {
  static void getPopularPeopleImages(
      {int? id,
      required Function(List<Profiles>?) onSuccess,
      required Function(int error) onError}) async {
    var headers = {"Content-Type": "application/json"};
    await http
        .get(
            getUri(
                "https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
            headers: headers)
        .then((response) {
      Map<String, dynamic> decoded;

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        decoded = json.decode(response.body);
        if (response.statusCode == 200) {
          PopularPeopleImagesModel images =
              PopularPeopleImagesModel.fromJson(decoded);
          onSuccess(images.profiles);
        }
      }
    });
  }
}
