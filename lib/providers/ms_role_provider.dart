import 'package:flutter/material.dart';
import 'package:test_login_api/models/ms_role_model.dart';
import 'package:test_login_api/services/ms_role_service.dart';

class MsRoleProvider with ChangeNotifier {
  MsRoleModel _msRole = MsRoleModel();

  MsRoleModel get msRole => _msRole;

  Future<void> getMsRole(BuildContext context, roleId) async {
    try {
      _msRole = await MsRoleService().getRole(context, roleId);
      print('gajeasdads');
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }
}
