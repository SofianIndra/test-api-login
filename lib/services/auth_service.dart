import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_login_api/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../models/token_model.dart';
import '../theme/theme.dart';

class AuthService {
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
      TokenModel token = TokenModel.fromJson(response.data);

      // Save Token to Local Storage
      await storeTokenToLocal(token);

      token.accessToken = 'Bearer ${token.accessToken}';
      // print(token.accessToken);
      return token;
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

    // print(res.body);
    // print(res.statusCode);

    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> storeTokenToLocal(TokenModel data) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'access_token', value: data.accessToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel data) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'username', value: data.username);
      await storage.write(key: 'password', value: data.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['username'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final UserModel data = UserModel(
          username: values['username'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'access_token');

    if (value != null) {
      token = 'Bearer $value';
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
