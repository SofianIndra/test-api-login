import 'package:flutter/material.dart';
import 'package:test_login_api/models/user_model.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/pages/widget/textfield_widget.dart';
import 'package:test_login_api/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: '');
    final usernameController = TextEditingController(text: '');
    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final confirmPasswordController = TextEditingController(text: '');
    var id = Uuid().v4().replaceAll('-', '').substring(0, 3);

    void handleRegister() async {
      bool response = await AuthService().register(
        UserModel(
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Register Success!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Register Failed!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

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
