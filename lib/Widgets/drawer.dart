import 'package:flutter/material.dart';
import 'package:iou/Routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
          child: Text('Test'),
          decoration: BoxDecoration(
            color: Colors.blue,
          )),
      ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.home);
          }),
      ListTile(
          title: Text('Contacts'),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.contacts);
          })
    ]));
  }
}
