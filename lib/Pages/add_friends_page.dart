import 'package:flutter/material.dart';

import 'package:iou/Models/user.dart';
import 'package:iou/Services/database_service.dart';

class AddFriends extends StatelessWidget {
  final String userUid;
  AddFriends(this.userUid);
  Future<List<User>> _searchUsers(String nameQuery) async {
    return await DatabaseService().searchUser(nameQuery);
  }

  Future<List<User>> _getUsers() async {
    return await DatabaseService().getAllUsers();
  }

  Widget _usersList() {
    return FutureBuilder<List<User>>(
        future: _getUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              List<User> users = snapshot.data ?? [];
              return _usersListView(users);
          }
        });
  }

  Widget _userListItem(User user, int index) {
    return new Container(
        child: ListTile(
      leading: new Hero(
          tag: index,
          child: new CircleAvatar(child: Text(user.fname[0] + user.lname[0]))),
      title: new Text(user.fname + " " + user.lname),
      subtitle: new Text(user.email),
      trailing: IconButton(
        icon: Icon(Icons.person_add),
        onPressed: () {},
      ),
    ));
  }

  Widget _usersListView(List<User> users) {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _userListItem(users[index], index);
                },
                itemCount: users.length)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Add friends")),
        body: Container(
            child: Column(
          children: [
            _usersList(),
          ],
        )));
  }
}
