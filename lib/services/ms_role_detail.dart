import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_login_api/models/ms_role_detail_model.dart';

import '../theme/theme.dart';
import 'auth_service.dart';

class MsRoleDetailService {
  // Get MsRoleDetail data with roleId and moduleId Filter
  Future<MsRoleDetailModel> getRoleDetailFilter(
      BuildContext context, roleId, moduleId) async {
    final token = await AuthService().getToken();
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/ms-role-detail/$roleId/$moduleId'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        MsRoleDetailModel data =
            MsRoleDetailModel.fromJson(jsonDecode(res.body));
        return data;
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
