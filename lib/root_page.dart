import 'package:flutter/material.dart';
import 'package:iou/Models/user.dart';

import 'package:iou/Routes/routes.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'auth_form.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      // signed in
      return HomePage();
    } else {
      return AuthForm();
    }
  }
}
