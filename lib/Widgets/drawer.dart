import 'package:flutter/material.dart';

import 'package:iou/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  final Function onSelectItem;
  final Function logout;
  final User user;
  final String uid;
  AppDrawer({this.onSelectItem, this.logout, this.user, this.uid});

  Widget _createFooterItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      UserAccountsDrawerHeader(
        accountEmail: Text(user.email),
        accountName: Text(user.fname + " " + user.lname),
      ),
      ListTile(
          title: Text('Home'),
          onTap: () {
            onSelectItem(0);
          }),
      ListTile(
          title: Text('Friends'),
          onTap: () {
            onSelectItem(1);
          }),
      ListTile(
          title: Text('Debt'),
          onTap: () {
            onSelectItem(2);
          }),
      ListTile(
          title: Text('Loaned'),
          onTap: () {
            onSelectItem(3);
          }),
      Expanded(child: Container()),
      Column(
        children: <Widget>[
          _createFooterItem(
              icon: Icons.settings, text: 'Settings', onTap: () => {}),
          _createFooterItem(
              icon: Icons.exit_to_app, text: 'Logout', onTap: () => logout())
        ],
      )
    ]));

    // return FutureBuilder<User>(
    //     future: getUser(),
    //     builder: (context, snapshot) {
    //       return Drawer(
    //           child: Column(children: <Widget>[
    //         UserAccountsDrawerHeader(
    //           accountEmail: Text(user.email),
    //           accountName: Text(user.fname + " " + user.lname),
    //         ),
    //         ListTile(
    //             title: Text('Home'),
    //             onTap: () {
    //               onSelectItem(0);
    //             }),
    //         ListTile(
    //             title: Text('Friends'),
    //             onTap: () {
    //               onSelectItem(1);
    //             }),
    //         ListTile(
    //             title: Text('Debt'),
    //             onTap: () {
    //               onSelectItem(2);
    //             }),
    //         ListTile(
    //             title: Text('Credit'),
    //             onTap: () {
    //               onSelectItem(3);
    //             }),
    //         Expanded(child: Container()),
    //         Column(
    //           children: <Widget>[
    //             _createFooterItem(
    //                 icon: Icons.settings, text: 'Settings', onTap: () => {}),
    //             _createFooterItem(
    //                 icon: Icons.exit_to_app,
    //                 text: 'Logout',
    //                 onTap: () => logout())
    //           ],
    //         )
    //       ]));
    //     });
  }
}
