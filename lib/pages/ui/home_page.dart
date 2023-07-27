import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/providers/ms_user_provider.dart';
import 'package:test_login_api/services/auth_service.dart';

import '../../providers/ms_role_detail_provider.dart';
import '../../providers/ms_role_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //======================  Override  ======================
  @override
  void initState() {
    final msUserProvider = Provider.of<MsUserProvider>(context, listen: false);
    msUserProvider.getMsUserApi();
    super.initState();
  }
  //====================  EndOverride  =====================

  @override
  Widget build(BuildContext context) {
    //======================  Variable  ======================
    final msRoleProvider = Provider.of<MsRoleProvider>(context, listen: false);
    final msUserProvider = Provider.of<MsUserProvider>(context, listen: false);
    final msRoleDetailProvider =
        Provider.of<MsRoleDetailProvider>(context, listen: false);
    //====================  EndVariable  =====================

    //======================  Method  ========================
    void clearLocalStorage() async {
      await AuthService().clearLocalStorage();
    }
    //====================  EndMethod  =======================

    //=======================  Event  ========================
    void logOutButton() {
      clearLocalStorage();
      Navigator.pushNamed(context, '/');
    }

    void profileButton() {
      Navigator.pushNamed(context, '/profile');
      msRoleProvider.getMsRole(context, msUserProvider.msUser.roleId);
    }

    void adminButton() {
      int moduleId = 37;
      msRoleDetailProvider.getMsRoleDetailFilter(
          context, msUserProvider.msUser.roleId, moduleId);
      Navigator.pushNamed(context, '/admin');
    }
    //====================  EndEvent  ========================

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
                  onTap: () {
                    logOutButton();
                  },
                  title: 'Log Out',
                ),
                SizedBox(
                  height: 30,
                ),
                //Profile Button
                ButtonWidget(
                  onTap: () {
                    profileButton();
                  },
                  title: 'Profile Page',
                ),
                SizedBox(
                  height: 30,
                ),
                //Admin Button
                ButtonWidget(
                  onTap: () {
                    adminButton();
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
