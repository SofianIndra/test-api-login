import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/auth_provider.dart';
import '../providers/ms_role_detail_provider.dart';
import '../providers/ms_role_provider.dart';
import '../providers/ms_user_provider.dart';

List<SingleChildWidget> providerList = [
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
];
