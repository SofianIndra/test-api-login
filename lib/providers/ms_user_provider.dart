import 'package:flutter/material.dart';
import 'package:test_login_api/services/ms_user_service.dart';

import '../models/user_model.dart';

class MsUserProvider with ChangeNotifier {
  UserModel _msUser = UserModel();

  UserModel get msUser => _msUser;

  // Get MsUser data from API
  Future<void> getMsUserApi() async {
    try {
      _msUser = await MsUserService().getUser();
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }
}
