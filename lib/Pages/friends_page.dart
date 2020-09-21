import 'package:flutter/material.dart';

import 'package:iou/Services/database_service.dart';
import 'package:iou/Models/user.dart';

class FriendsPage extends StatelessWidget {
  final String userUid;
  FriendsPage({this.userUid});

  final _database = DatabaseService();

  Future<List<User>> _getFriendsList() async {
    var currentUser = await _database.getUser(userUid);

    List<User> friendsList;

    for (var friendUid in currentUser.friends) {
      User friend = await _database.getUser(friendUid);

      friendsList.add(friend);
    }

    return friendsList;
  }

  Widget _friendsListView() {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _friendsListItem(index);
                },
                itemCount: 10)));
  }

  Widget _friendsListItem(int index) {
    return new Container(
        child: ListTile(
      leading: new Hero(tag: index, child: new CircleAvatar(child: Text("SY"))),
      title: new Text("testing"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_friendsListView()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add Friends',
        child: const Icon(Icons.add),
      ),
    );
  }
}
