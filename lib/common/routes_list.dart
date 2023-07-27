import 'package:flutter/cupertino.dart';

import '../pages/ui/add_page.dart';
import '../pages/ui/admin_page.dart';
import '../pages/ui/edit_page.dart';
import '../pages/ui/export_page.dart';
import '../pages/ui/home_page.dart';
import '../pages/ui/login_page.dart';
import '../pages/ui/print_page.dart';
import '../pages/ui/profile_page.dart';
import '../pages/ui/register_page.dart';

var customList = <String, WidgetBuilder>{
  '/': (context) => LoginPage(),
  '/home': (context) => HomePage(),
  '/register': (context) => RegisterPage(),
  '/profile': (context) => ProfilePage(),
  '/admin': (context) => AdminPage(),
  '/add': (context) => AddPage(),
  '/edit': (context) => EditPage(),
  '/print': (context) => PrintPage(),
  '/export': (context) => ExportPage(),
};
