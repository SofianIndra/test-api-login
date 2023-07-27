import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/providers/ms_role_detail_provider.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    //======================  Variable  ======================
    final msRoleDetail = Provider.of<MsRoleDetailProvider>(context);
    final roleDetail = msRoleDetail.msRoleDetail;
    //====================  EndVariable  =====================

    return Scaffold(
      backgroundColor: roleDetail.edit == true ? Colors.green : Colors.red,
      body: Center(
        child: Text(
          roleDetail.edit == true ? 'SUCCESS' : 'FAILED',
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
