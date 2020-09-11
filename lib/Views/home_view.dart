import 'package:flutter/material.dart';
import 'package:iou/Pages/credit_page.dart';
import 'package:iou/Pages/debt_page.dart';
import 'package:iou/Pages/friends_page.dart';
import 'package:iou/Pages/home_page.dart';

import '../Widgets/drawer.dart';
import 'package:iou/Services/auth.dart';
import 'package:iou/Services/firestore_service.dart';
import 'package:iou/Models/user.dart';

class HomeView extends StatefulWidget {
  final User user;
  HomeView({this.user});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Auth auth = Auth();

  int _selectedDrawerIndex = 0;
  String _title = 'Home';

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return HomePage();
      case 1:
        return FriendsPage();
      case 2:
        return DebtPage();
      case 3:
        return CreditPage();
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'Friends';
          }
          break;
        case 2:
          {
            _title = 'Debt';
          }
          break;
        case 3:
          {
            _title = 'Credit';
          }
          break;
      }
    });
    Navigator.of(context).pop(); // close the drawer
  }

  _logout() async {
    await auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(
            onSelectItem: _onSelectItem, logout: _logout, user: widget.user),
        appBar: AppBar(
          title: Text(_title),
          // actions: <Widget>[
          //   FlatButton.icon(
          //       icon: Icon(Icons.person),
          //       label: Text('Logout'),
          //       onPressed: () async {
          //         await auth.logout();
          //       })
          // ],
        ),
        body: _getDrawerItem(_selectedDrawerIndex)
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: new Icon(Icons.home), title: new Text("Home")),
        //     BottomNavigationBarItem(
        //         icon: new Icon(Icons.contacts), title: new Text("Contacts")),
        //     BottomNavigationBarItem(
        //         icon: new Icon(Icons.account_balance),
        //         title: new Text("Transactions"))
        //   ],
        // ),
        // body: RequestsList()
        );
  }
}
