import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iou/Services/database_service.dart';
//import 'package:iou/Services/firestore_service.dart';
import '../Models/user.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();

  User currentUser;

  //final User _currentUser;

  FirebaseUser userFromFirebaseUser(FirebaseUser user) {
    return user != null ? user : null;
  }

  Stream<FirebaseUser> get user {
    return firebaseAuth.onAuthStateChanged.map(userFromFirebaseUser);
  }

  Future populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      return currentUser = await _databaseService.getUser(user.uid);
    }
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

  Future signup(
      String email, String password, String fname, String lname) async {
    try {
      FirebaseUser user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      await _databaseService.addUser(User(
          uid: user.uid,
          email: email,
          fname: fname,
          lname: lname,
          friends: <String>[]));

      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCurrentUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    //await populateCurrentUser(user);
    return await _databaseService.getUser(user.uid);
  }

  Future logout() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
