import 'package:flutter/material.dart';
import 'package:iou/Pages/add_records_page.dart';

class DebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_debtListView()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddRecordsPage()))
        },
        tooltip: 'Add Record',
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
