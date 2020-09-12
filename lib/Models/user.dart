import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class User {
//   final String uid;
//   User({this.uid});
// }

class User {
  final String uid;
  String email;
  String fname;
  String lname;
  List<User> friends;

  User({this.uid, this.email, this.fname, this.lname});

  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        email = data['email'],
        fname = data['fname'],
        lname = data['lname'];

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'fname': fname, 'lname': lname};
  }
}
