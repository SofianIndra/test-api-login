import 'dart:convert';

import 'package:test_login_api/services/auth_service.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../theme/theme.dart';

class MsUserService {
  Future<UserModel> getUser() async {
    final token = await AuthService().getToken();
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/ms-user/'),
        headers: {'Authorization': token},
      );

      // print(token);

      // print(res.body);

      if (res.statusCode == 200) {
        UserModel data = UserModel.fromJson(jsonDecode(res.body));

        return data;
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
