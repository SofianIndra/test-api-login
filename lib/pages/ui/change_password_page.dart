import 'package:flutter/material.dart';
import 'package:test_login_api/models/change_password_model.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/pages/widget/textfield_widget.dart';

import '../../services/auth_service.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    //======================  Variable  ======================
    final passwordController = TextEditingController(text: '');
    final newPasswordController = TextEditingController(text: '');
    //====================  EndVariable  =====================

    //======================  Method  ========================
    void showSnackbar(color, title) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    //====================  EndMethod  =======================

    //=======================  Event  ========================
    void changePasswordButton() async {
      bool response = await AuthService().changePassword(
        ChangePasswordModel(
          password: passwordController.text,
          newPassword: newPasswordController.text,
        ),
      );
      if (response) {
        showSnackbar(
          Colors.green,
          'Change Password Success',
        );
        passwordController.clear();
        newPasswordController.clear();
      } else if (passwordController.text.isEmpty ||
          newPasswordController.text.isEmpty) {
        showSnackbar(
          Colors.red,
          'Please insert all field',
        );
      } else {
        showSnackbar(
          Colors.red,
          'Change Password Failed',
        );
      }
    }
    //====================  EndEvent  ========================

    return Scaffold(
        backgroundColor: Colors.orange,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 120,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextfieldWidget(
                  controller: passwordController,
                  title: 'Password',
                  hintText: 'Enter your password',
                ),
                TextfieldWidget(
                  controller: newPasswordController,
                  title: 'New Password',
                  hintText: 'Enter your new password',
                ),
                ButtonWidget(
                  onTap: () {
                    changePasswordButton();
                  },
                  title: 'Submit',
                )
              ],
            ),
          ],
        ));
  }
}
