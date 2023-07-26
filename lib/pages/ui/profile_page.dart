import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api/pages/widget/profile_content_widget.dart';
import 'package:test_login_api/providers/ms_role_provider.dart';
import 'package:test_login_api/providers/ms_user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final msUserProvider = Provider.of<MsUserProvider>(context);
    final msRoleProvider = Provider.of<MsRoleProvider>(context);
    final user = msUserProvider.msUser;
    final role = msRoleProvider.msRole;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book_outlined,
              size: 120,
            ),
            SizedBox(
              height: 16,
            ),
            ProfileContentWidget(
              title: 'Name :',
              content: user.name.toString(),
            ),
            ProfileContentWidget(
              title: 'Username :',
              content: user.username.toString(),
            ),
            ProfileContentWidget(
              title: 'Email :',
              content: user.email.toString(),
            ),
            ProfileContentWidget(
              title: 'Code :',
              content: user.code.toString(),
            ),
            ProfileContentWidget(
              title: 'Alias :',
              content: user.alias.toString(),
            ),
            ProfileContentWidget(
              title: 'Role ID :',
              content: user.roleId.toString(),
            ),
            ProfileContentWidget(
              title: 'Role :',
              content: role.alias.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
