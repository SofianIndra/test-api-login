import 'package:flutter/material.dart';
import 'package:test_login_api/models/ms_role_model.dart';
import 'package:test_login_api/services/ms_role_service.dart';

class MsRoleProvider with ChangeNotifier {
  MsRoleModel _msRoleTest = MsRoleModel();

  MsRoleModel get msRoleTest => _msRoleTest;

  Future<void> getMsRole(BuildContext context, roleId) async {
    try {
      _msRoleTest = await MsRoleService().getRole(context, roleId);
      print(_msRoleTest.roleName);
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }
}
