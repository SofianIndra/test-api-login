import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/providers/ms_role_detail_provider.dart';

class PrintPage extends StatelessWidget {
  const PrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final msRoleDetail = Provider.of<MsRoleDetailProvider>(context);
    final roleDetail = msRoleDetail.msRoleDetail;

    return Scaffold(
      backgroundColor: roleDetail.print == true ? Colors.green : Colors.red,
      body: Center(
        child: Text(
          roleDetail.print == true ? 'SUCCESS' : 'FAILED',
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
