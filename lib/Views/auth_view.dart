import 'package:flutter/material.dart';
import 'package:iou/Pages/login.dart';
import 'package:iou/Pages/signup.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool showLoginForm = true;
  void toggleForm() {
    setState(() {
      showLoginForm = !showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginForm) {
      return Login(toggleForm: toggleForm);
    } else {
      return Signup(toggleForm: toggleForm);
    }
  }
}
