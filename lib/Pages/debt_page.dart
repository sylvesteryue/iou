import 'package:flutter/material.dart';

import 'package:iou/Pages/add_records_page.dart';
import 'package:iou/Models/record.dart';
import 'package:iou/Services/database_service.dart';

class DebtPage extends StatelessWidget {
  final String userUid;
  DebtPage({this.userUid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_debtList()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddRecordsPage(
                        userUid: userUid,
                      )))
        },
        tooltip: 'Add Record',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Record>> _getDebt() async {
    return await DatabaseService().getUserDebt(userUid);
  }

  Widget _debtList() {
    return FutureBuilder(
      future: _getDebt(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            List<Record> debtRecordList = snapshot.data ?? [];
            return _debtListView(debtRecordList);
        }
      },
    );
  }

  Widget _debtListView(List<Record> debtRecordList) {
    return new Container(
        child: Flexible(
            child: new ListView.builder(
                itemBuilder: (context, index) {
                  return _getDebtListItem(debtRecordList[index], index);
                },
                itemCount: debtRecordList.length)));
  }

  Widget _getDebtListItem(Record debt, int index) {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Card(
            child: ListTile(
                title: Text(debt.moneyAmt.toString()),
                subtitle: Text(debt.loanerUid))));
  }
}
