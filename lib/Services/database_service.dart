import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iou/Models/user.dart';

class DatabaseService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  final CollectionReference _transactioncollectionReference =
      Firestore.instance.collection("transactions");

  Future<void> addUser(User user) async {
    try {
      await _usersCollectionReference.document(user.uid).setData(user.toJson());
    } catch (e) {
      //print(e);
      return null;
    }
  }

  Future<User> getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      //print(e);
      return null;
    }
  }
}
