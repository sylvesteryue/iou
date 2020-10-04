import 'package:flutter/material.dart';

import 'package:iou/Pages/add_records_page.dart';

import 'package:iou/Services/database_service.dart';
import 'package:iou/Models/record.dart';

class LoanedPage extends StatelessWidget {
  final String userUid;
  LoanedPage({this.userUid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_loanedList()]),
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

  Future<List<Record>> _getLoaned() async {
    return await DatabaseService().getUserLoaned(userUid);
  }

  Widget _loanedList() {
    return FutureBuilder(
      future: _getLoaned(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            List<Record> loanedRecordList = snapshot.data ?? [];
            return _loanedListView(loanedRecordList);
        }
      },
    );
  }

  Widget _loanedListView(List<Record> loanedRecordList) {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _getLoanedListItem(loanedRecordList[index], index);
                },
                itemCount: loanedRecordList.length)));
  }

  Widget _getLoanedListItem(Record debt, int index) {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Card(
            child: ListTile(
                title: Text(debt.moneyAmt.toString()),
                subtitle: Text(debt.loanerUid))));
  }
}
