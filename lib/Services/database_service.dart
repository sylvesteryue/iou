import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:iou/Models/user.dart';
import 'package:iou/Models/record.dart';

class DatabaseService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  final CollectionReference _recordsCollectionReference =
      Firestore.instance.collection("records");

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

  Future<List<User>> getAllUsers() async {
    try {
      var users = (await _usersCollectionReference.getDocuments()).documents;
      return users.map((userData) => User.fromData(userData.data)).toList();
    } catch (e) {
      //print(e);
      return null;
    }
  }

  Future<List<User>> searchUser(String nameQuery) async {
    try {
      var users = (await _usersCollectionReference
              .where("fname",
                  isEqualTo:
                      nameQuery.toLowerCase().substring(0, 1).toUpperCase())
              .getDocuments())
          .documents;
      return users.map((userData) => User.fromData(userData.data)).toList();
    } catch (e) {
      //print(e);
      return null;
    }
  }

  Future<void> addRecord(Record record) async {
    try {
      await _recordsCollectionReference.add(record.toJson());
    } catch (e) {
      return null;
    }
  }
}
