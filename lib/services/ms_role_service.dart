import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_login_api/models/ms_role_model.dart';

import '../theme/theme.dart';
import 'auth_service.dart';

class MsRoleService {
  // Get Role data from API
  Future<MsRoleModel> getRole(BuildContext context, roleId) async {
    final token = await AuthService().getToken();
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/ms-role/$roleId'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        MsRoleModel data = MsRoleModel.fromJson(jsonDecode(res.body));
        return data;
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
