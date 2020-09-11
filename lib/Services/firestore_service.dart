import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iou/Models/user.dart';

class FirestoreService {
  final String uid;
  FirestoreService({this.uid});

  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  Future createUser(UserData user) async {
    try {
      await _usersCollectionReference.document(user.uid).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return UserData.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Stream<UserData> get user {
    return _usersCollectionReference
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: snapshot.data['uid'],
        email: snapshot.data['email'],
        fname: snapshot.data['fname'],
        lname: snapshot.data['lname']);
  }
}
