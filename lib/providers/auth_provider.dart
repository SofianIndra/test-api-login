import 'package:flutter/material.dart';
import 'package:test_login_api/models/sign_in_form_model.dart';
import 'package:test_login_api/models/token_model.dart';

import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  TokenModel? _user;

  TokenModel get user => _user!;

  set user(TokenModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    String password = '',
    String username = '',
  }) async {
    try {
      TokenModel user = await AuthService().login(
        SignInFormModel(
          username: username,
          password: password,
        ),
      );
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
