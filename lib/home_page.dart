import 'package:flutter/material.dart';

import 'Widgets/drawer.dart';
import 'package:iou/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await auth.logout();
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.contacts), title: new Text("Contacts")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance),
              title: new Text("Transactions"))
        ],
      ),
      // body: RequestsList()
    );
  }
}

// class RequestsList extends StatefulWidget {

// }
