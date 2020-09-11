import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
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
