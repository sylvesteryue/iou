import 'package:flutter/material.dart';
import 'package:iou/Models/user.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';
import 'auth_view.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    if (user != null) {
      // signed in
      return HomeView(uid: user.uid);
    } else {
      return AuthView();
    }
  }
}
