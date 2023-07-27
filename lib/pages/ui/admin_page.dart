import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/pages/widget/button_widget.dart';
import 'package:test_login_api/providers/ms_role_detail_provider.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    //======================  Variable  ======================
    final msRoleDetailProvider = Provider.of<MsRoleDetailProvider>(context);
    final roleDetail = msRoleDetailProvider.msRoleDetail;
    //====================  EndVariable  =====================

    return roleDetail.view == true
        ? Scaffold(
            backgroundColor: Colors.deepPurple,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SUCCESS',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Add Button
                  ButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/add');
                    },
                    title: 'ADD',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Edit Button
                  ButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/edit');
                    },
                    title: 'EDIT',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Print Button
                  ButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/print');
                    },
                    title: 'PRINT',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Export Button
                  ButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/export');
                    },
                    title: 'EXPORT',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text(
                'FAILED',
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
