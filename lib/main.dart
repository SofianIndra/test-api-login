import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/common/provider_list.dart';
import 'package:test_login_api/common/routes_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList,
      child: MaterialApp(
        routes: customList,
      ),
    );
  }
}
