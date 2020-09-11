import 'package:flutter/material.dart';
import 'package:iou/Models/user.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';
import 'auth_view.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      // signed in
      return HomeView(user: user);
    } else {
      return AuthView();
    }
  }
}
