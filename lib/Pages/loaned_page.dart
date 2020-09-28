import 'package:flutter/material.dart';

import 'package:iou/Pages/add_records_page.dart';

class LoanedPage extends StatelessWidget {
  final String userUid;
  LoanedPage({this.userUid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_loanedListView()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddRecordsPage(userUid: userUid)))
        },
        tooltip: 'Add Record',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _loanedListView() {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _getloanedListItem(index);
                },
                itemCount: 10)));
  }

  Widget _getloanedListItem(int index) {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Card(
            child: ListTile(
                title: Text("Someone owes you some money"),
                subtitle: Text("moneyyyy"))));
  }
}
