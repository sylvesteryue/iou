import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/user.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

  Stream<User> get user {
    return firebaseAuth.onAuthStateChanged.map(userFromFirebaseUser);
  }

  Future login(String email, String password) async {
    try {
      FirebaseUser user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signup(String email, String password) async {
    try {
      FirebaseUser user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return userFromFirebaseUser(user);
  }

  Future logout() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
