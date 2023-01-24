import 'dart:convert';
import 'dart:developer';

import 'package:course_task/data/global_methods/debuging_requsets.dart';
import 'package:course_task/domain/models/popular_people_data_model.dart';

import '../../domain/models/popular_people_images_model.dart';
import '../../domain/models/popular_pepole_model.dart';
import 'package:http/http.dart' as http;

import '../global_methods/uri_parsing_method.dart';

class HomeScreenRequest {
  static void UserAuthrequest(
      {required String? email,
      required String? password,
      required Function onSuccess,
      required Function(String error) onError}) async {
    var headers = {
      "Content-Type": "application/json",
    };
    http
        .post(getUri('https://api.almotawef.com/api/admin/auth/login'),
            headers: headers,
            body: json.encode({"email": email, "password": password}))
        .then((response) async {
      Map<String, dynamic> decoded;
      log(response.body + "\n" + response.statusCode.toString());
      // modiling
      if (response.statusCode == 200) {
        log(response.body);
        decoded = json.decode(response.body);
        onSuccess();
      } else {
        log(response.body);
        onError("user not found");
      }
    });
  }
}
