import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/providers/ms_user_provider.dart';
import 'package:test_login_api/services/auth_service.dart';

import '../../providers/ms_role_provider.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    final msUserProvider = Provider.of<MsUserProvider>(context, listen: false);
    msUserProvider.getMsUserApi();

    final msRoleProvider = Provider.of<MsRoleProvider>(context, listen: false);

    msRoleProvider.getMsRole(context, msUserProvider.msUser.roleId);
    print(msRoleProvider.msRole.roleName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'SUCCESS',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Logout Button
                ButtonWidget(
                  onTap: () async {
                    await AuthService().clearLocalStorage();
                    Navigator.pushNamed(context, '/');
                  },
                  title: 'Log Out',
                ),
                SizedBox(
                  height: 30,
                ),
                //Profile Button
                ButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  title: 'Profile Page',
                ),
                SizedBox(
                  height: 30,
                ),
                //Admin Button
                ButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, '/admin');
                  },
                  title: 'Admin Page',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
