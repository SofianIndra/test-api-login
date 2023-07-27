import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/pages/widget/textfield_widget.dart';
import 'package:test_login_api/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');

    handleSignIn() async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      // print(usernameController.text);
      // print(passwordController.text);
      if (await authProvider.login(
        username: usernameController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Gagal Login!',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.ac_unit_outlined,
                size: 160,
              ),
              // Username TextField
              TextfieldWidget(
                controller: usernameController,
                title: 'Username :',
                hintText: 'Masukan Username',
              ),
              // Password TextField
              TextfieldWidget(
                controller: passwordController,
                title: 'Password :',
                hintText: 'Masukan Password',
              ),
              ButtonWidget(
                onTap: () {
                  handleSignIn();
                },
                title: 'Login',
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Create a new account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
