import 'package:flutter/material.dart';
import 'package:test_login_api/models/sign_up_form_model.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/pages/widget/textfield_widget.dart';
import 'package:test_login_api/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //======================  Variable  ======================
    final nameController = TextEditingController(text: '');
    final usernameController = TextEditingController(text: '');
    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final confirmPasswordController = TextEditingController(text: '');
    var id = Uuid().v4().replaceAll('-', '').substring(0, 3);
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
    void handleRegister() async {
      bool response = await AuthService().register(
        SignUpFormModel(
          roleId: 29,
          code: 'SM-$id',
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          alias: nameController.text.substring(0, 3).toUpperCase(),
          password: passwordController.text,
          isActive: true,
          createdBy: nameController.text,
        ),
      );
      if (response) {
        showSnackbar(
          Colors.green,
          'Register Success',
        );
      } else {
        showSnackbar(
          Colors.red,
          'Register Failed',
        );
      }
    }
    //====================  EndEvent  ========================

    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Register your account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //USERNAME
                TextfieldWidget(
                  controller: usernameController,
                  title: 'Username',
                  hintText: "Masukan Username",
                ),
                //NAME
                TextfieldWidget(
                  controller: nameController,
                  title: 'Name',
                  hintText: "Masukan Name",
                ),
                //EMAIL
                TextfieldWidget(
                  controller: emailController,
                  title: 'Email Address',
                  hintText: "Masukan Email",
                ),
                //PASSWORD
                TextfieldWidget(
                  controller: passwordController,
                  title: 'Password',
                  hintText: "Masukan Password",
                ),
                //CONFIRM PASSWORD
                TextfieldWidget(
                  controller: confirmPasswordController,
                  title: 'Confirm Password',
                  hintText: "Masukan Password",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonWidget(
                  onTap: () {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Password do not match',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else if (usernameController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Please insert all field',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      handleRegister();
                      nameController.clear();
                      usernameController.clear();
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
                    }
                  },
                  title: 'Register',
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
