import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_login_api/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../models/token_model.dart';

class AuthService {
  String baseUrl = 'http://10.11.12.151:8000';

  Future<TokenModel> login(UserModel data) async {
    var url = '$baseUrl/ms-user/token';
    var formData = FormData.fromMap(
      data.toJson(),
    );

    final dio = Dio();

    var response = await dio.post(
      url,
      data: formData,
    );

    // print(response.data);

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.data);
      TokenModel user = TokenModel.fromJson(response.data);
      user.accessToken = 'Bearer ${user.accessToken}';
      print(user.accessToken);
      return user;
    } else {
      throw jsonDecode(response.data)['message'];
    }
  }

  Future register(UserModel data) async {
    var url = '$baseUrl/ms-user/';
    var body = jsonEncode(data.toJson());
    var headers = {'Content-type': 'application/json'};

    var res = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(res.body);
    print(res.statusCode);

    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
