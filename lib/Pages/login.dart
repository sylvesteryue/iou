import 'package:flutter/material.dart';

import 'package:iou/Services/auth.dart';

class Login extends StatefulWidget {
  final Function toggleForm;
  Login({this.toggleForm});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Auth auth = Auth();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String passwordValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  void showError(String error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Error"),
              content: Text(error),
              actions: <Widget>[
                FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        obscureText: false,
        validator: emailValidator,
        onChanged: (val) => setState(() => email = val),
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ));

    final passwordField = TextFormField(
        obscureText: true,
        validator: passwordValidator,
        onChanged: (val) => setState(() => password = val),
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ));

    final loginButton = OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            dynamic result = await auth.login(email, password);
            if (result == null) {
              showError('Account does not exist');
            }
          }
        },
        child: Text("Login", textAlign: TextAlign.center));

    final signUpLink = Row(
      children: <Widget>[
        Text("Don't have an account? "),
        GestureDetector(
            onTap: () {
              widget.toggleForm();
            },
            child:
                Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold)))
      ],
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                      key: _formKey,
                      child: ListView(shrinkWrap: true,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            emailField,
                            SizedBox(height: 8.0),
                            passwordField,
                            SizedBox(height: 24.0),
                            loginButton,
                            SizedBox(height: 10.0),
                            signUpLink
                          ])))),
        ));
  }
}
