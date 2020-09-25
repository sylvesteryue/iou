import 'package:flutter/material.dart';
import 'package:iou/Pages/add_friends_page.dart';

import 'package:iou/Services/database_service.dart';
import 'package:iou/Models/user.dart';

class FriendsPage extends StatelessWidget {
  final String userUid;
  FriendsPage({this.userUid});

  final _database = DatabaseService();

  Future<List<User>> _getFriendsList() async {
    var currentUser = await _database.getUser(userUid);

    List<User> friendsList = [];

    for (var friendUid in currentUser.friends) {
      User friend = await _database.getUser(friendUid);

      friendsList.add(friend);
    }

    return friendsList;
  }

  Widget _friendsList() {
    return FutureBuilder<List<User>>(
        future: _getFriendsList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              List<User> friends = snapshot.data ?? [];
              return _friendsListView(friends);
          }
        });
  }

  Widget _friendsListView(List<User> friends) {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _friendsListItem(friends[index], index);
                },
                itemCount: friends.length)));
  }

  Widget _friendsListItem(User friend, int index) {
    return new Container(
        child: ListTile(
            leading: new Hero(
                tag: index,
                child: new CircleAvatar(
                    child: Text(friend.fname[0] + friend.lname[0]))),
            title: new Text(friend.fname + " " + friend.lname),
            subtitle: new Text(friend.email),
            onTap: () {
              print(friend.uid);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_friendsList()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddFriends(userUid)))
        },
        tooltip: 'Add Friends',
        child: const Icon(Icons.add),
      ),
    );
  }
}
