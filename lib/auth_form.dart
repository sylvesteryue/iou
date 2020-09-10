import 'package:flutter/material.dart';
import 'package:iou/Screens/login.dart';
import 'package:iou/Screens/signup.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
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
