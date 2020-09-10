import 'package:flutter/material.dart';

class CreditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("No one owes you money!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
