import 'package:flutter/material.dart';

class DebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text("You don't owe any money!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
