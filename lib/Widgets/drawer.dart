import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function onSelectItem;
  final Function logout;
  AppDrawer({this.onSelectItem, this.logout});

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
      DrawerHeader(
          decoration: BoxDecoration(
        color: Colors.blue,
      )),
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
          title: Text('Credit'),
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
  }
}