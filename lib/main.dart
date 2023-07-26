import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/pages/ui/admin_page.dart';
import 'package:test_login_api/pages/ui/login_page.dart';
import 'package:test_login_api/pages/ui/profile_page.dart';
import 'package:test_login_api/pages/ui/register_page.dart';
import 'package:test_login_api/pages/ui/success_page.dart';
import 'package:test_login_api/providers/auth_provider.dart';
import 'package:test_login_api/providers/ms_role_detail_provider.dart';
import 'package:test_login_api/providers/ms_role_provider.dart';
import 'package:test_login_api/providers/ms_user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MsUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MsRoleDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MsRoleProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => LoginPage(),
          '/success': (context) => SuccessPage(),
          '/register': (context) => RegisterPage(),
          '/profile': (context) => ProfilePage(),
          '/admin': (context) => AdminPage(),
        },
      ),
    );
  }
}
