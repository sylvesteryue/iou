import 'package:flutter/material.dart';

class DebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_debtListView()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _debtListView() {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _getDebtListItem(index);
                },
                itemCount: 10)));
  }

  Widget _getDebtListItem(int index) {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Card(
            child: ListTile(
                title: Text("You owe some money"),
                subtitle: Text("moneyyyy"))));
  }
}
