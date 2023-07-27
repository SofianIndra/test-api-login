import 'package:flutter/material.dart';
import 'package:test_login_api/models/ms_role_detail_model.dart';

import '../services/ms_role_detail.dart';

class MsRoleDetailProvider with ChangeNotifier {
  MsRoleDetailModel _msRoleDetail = MsRoleDetailModel();

  MsRoleDetailModel get msRoleDetail => _msRoleDetail;

  // Get MsRoleDetailFilter Data from API
  Future<void> getMsRoleDetailFilter(
      BuildContext context, roleId, moduleId) async {
    try {
      _msRoleDetail = await MsRoleDetailService()
          .getRoleDetailFilter(context, roleId, moduleId);
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }
}
