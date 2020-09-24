import 'package:flutter/material.dart';
import 'package:iou/Pages/credit_page.dart';
import 'package:iou/Pages/debt_page.dart';
import 'package:iou/Pages/friends_page.dart';
import 'package:iou/Pages/home_page.dart';

import '../Widgets/drawer.dart';
import 'package:iou/Services/auth.dart';
import 'package:iou/Services/database_service.dart';
import 'package:iou/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatefulWidget {
  final String uid;
  HomeView(this.uid);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Auth auth = Auth();
  User currentUser;

  int _selectedDrawerIndex = 0;
  String _title = 'Home';

  @override
  void initState() {
    auth.getCurrentUser().then((user) {
      setState(() => currentUser = user);
    });
    super.initState();
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return HomePage();
      case 1:
        return FriendsPage(
          userUid: widget.uid,
        );
      case 2:
        return DebtPage(userUid: widget.uid);
      case 3:
        return CreditPage(userUid: widget.uid);
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
            onSelectItem: _onSelectItem, logout: _logout, user: currentUser),
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _getDrawerItem(_selectedDrawerIndex));
  }
}
