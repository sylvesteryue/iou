import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('No friends yet? Make some!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add Friends',
        child: const Icon(Icons.add),
      ),
    );
  }
}
