import 'package:flutter/material.dart';
import 'package:test_login_api/models/token_model.dart';
import 'package:test_login_api/models/user_model.dart';

import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  TokenModel? _user;

  TokenModel get user => _user!;

  set user(TokenModel user) {
    _user = user;
    notifyListeners();
  }

  // Future<bool> register({
  //   String name = '',
  //   String username = '',
  //   String password = '',
  //   String email = '',
  // }) async {
  //   try {
  //     UserModel user = await AuthService().register(
  //       name: name,
  //       username: username,
  //       email: email,
  //       password: password,
  //     );
  //     _user = user;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<bool> login({
    String password = '',
    String username = '',
  }) async {
    try {
      TokenModel user = await AuthService().login(
        UserModel(
          username: username,
          password: password,
        ),
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
