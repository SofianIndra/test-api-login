import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/providers/ms_role_detail_provider.dart';

import '../../providers/ms_user_provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    int moduleId = 37;
    final msRoleDetailProvider =
        Provider.of<MsRoleDetailProvider>(context, listen: false);
    final msUserProvider = Provider.of<MsUserProvider>(context, listen: false);

    msRoleDetailProvider.getMsRoleDetailFilter(
        context, msUserProvider.msUser.roleId, moduleId);
    print(msUserProvider.msUser.roleId);
    print(moduleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final msRoleDetailProvider = Provider.of<MsRoleDetailProvider>(context);
    final roleDetail = msRoleDetailProvider.msRoleDetail;
    return Scaffold(
      backgroundColor: roleDetail.view == true ? Colors.deepPurple : Colors.red,
      body: Center(
        child: Text(
          roleDetail.view == true ? 'SUCCESS' : 'FAILED',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
