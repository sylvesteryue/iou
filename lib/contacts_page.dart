import 'package:flutter/material.dart';

import 'Widgets/drawer.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPage createState() => _ContactsPage();
}

class _ContactsPage extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      // body: RequestsList()
    );
  }
}

// class RequestsList extends StatefulWidget {

// }
