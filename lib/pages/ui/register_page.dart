import 'package:flutter/material.dart';
import 'package:test_login_api/models/user_model.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/pages/widget/textfield_widget.dart';
import 'package:test_login_api/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final roleIdController = TextEditingController(text: '');
    final codeController = TextEditingController(text: '');
    final nameController = TextEditingController(text: '');
    final usernameController = TextEditingController(text: '');
    final emailController = TextEditingController(text: '');
    final aliasController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');

    void handleRegister() async {
      bool response = await AuthService().register(
        UserModel(
          roleId: int.tryParse(roleIdController.text),
          code: codeController.text,
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          alias: aliasController.text,
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
              'Register Berhasil!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Gagal Register!',
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
                //ROLE ID
                TextfieldWidget(
                  controller: roleIdController,
                  title: 'Role ID',
                  hintText: "Masukan Role ID",
                ),
                //CODE
                TextfieldWidget(
                  controller: codeController,
                  title: 'Code',
                  hintText: "Masukan Code",
                ),
                //NAME
                TextfieldWidget(
                  controller: nameController,
                  title: 'Name',
                  hintText: "Masukan Name",
                ),
                //USERNAME
                TextfieldWidget(
                  controller: usernameController,
                  title: 'Username',
                  hintText: "Masukan Username",
                ),
                //EMAIL
                TextfieldWidget(
                  controller: emailController,
                  title: 'Email Address',
                  hintText: "Masukan Email",
                ),
                //ALIAS
                TextfieldWidget(
                  controller: aliasController,
                  title: 'Alias',
                  hintText: "Masukan Alias",
                ),
                //PASSWORD
                TextfieldWidget(
                  controller: passwordController,
                  title: 'Password',
                  hintText: "Masukan Password",
                ),
                SizedBox(
                  height: 16,
                ),
                ButtonWidget(
                  onTap: () {
                    handleRegister();
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
