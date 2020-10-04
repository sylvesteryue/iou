import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iou/Services/database_service.dart';
import 'package:iou/Models/user.dart';
import 'package:iou/Models/record.dart';

class AddRecordsPage extends StatefulWidget {
  final String userUid;
  AddRecordsPage({this.userUid});
  @override
  _AddRecordsPageState createState() => _AddRecordsPageState();
}

class _AddRecordsPageState extends State<AddRecordsPage> {
  final _formKey = GlobalKey<FormState>();
  final _database = DatabaseService();

  User friend;
  String friendUid = '';
  String money = '';
  String _description = '';
  String _type = 'Debt';

  String moneyValidator(String value) {
    Pattern pattern = r"^[1-9][0-9]*(\.[0-9]{1,2})?$";
    RegExp regex = new RegExp(pattern);

    if (value.length == 0) {
      return 'Please enter a value';
    }

    if (!regex.hasMatch(value)) {
      return 'Money value is not in valid format';
    } else {
      return null;
    }
  }

  String descriptionValidator(String value) {
    if (value.length == 0) {
      return 'Please enter a description';
    } else {
      return null;
    }
  }

  Future<List<User>> _getFriends() async {
    var currentUser = await _database.getUser(widget.userUid);

    List<User> friendsList = [];

    //friendsList.add(currentUser);

    for (var friendUid in currentUser.friends) {
      User friend = await _database.getUser(friendUid);

      friendsList.add(friend);
    }

    return friendsList;
  }

  // void searchUser(String searchText) {

  // }

  // void _chooseFriendBottomModalSheet(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Container(
  //             height: MediaQuery.of(context).size.height * .60,
  //             child: Padding(padding: const EdgeInsets.all(8.0)));
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    //modify for better results
    final chooseFriendDropdown = FutureBuilder<List<User>>(
        future: _getFriends(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Text('loading');
            default:
              return new DropdownButton(
                  hint: Text("Choose your friend"),
                  //value: friendUid,
                  items: snapshot.data.map((friend) {
                    return DropdownMenuItem<User>(
                        child: Text(friend.fname +
                            " " +
                            friend.lname +
                            " (" +
                            friend.email +
                            ")"),
                        value: friend);
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      friend = value;
                    });
                  });
          }
        });

    final moneyTextField = TextFormField(
        validator: moneyValidator,
        onChanged: (val) => setState(() => money = val),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r"^[0-9.]*")),
          FilteringTextInputFormatter.singleLineFormatter
        ],
        keyboardType: TextInputType.numberWithOptions(decimal: true));

    final descriptionTextField = TextFormField(
        maxLines: 8,
        validator: descriptionValidator,
        onChanged: (val) => setState(() => _description = val));

    final submitButton = OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {
          if (_type == "Debt")
            _database.addRecord(Record(
                debtorUid: widget.userUid,
                description: _description,
                loanerUid: friendUid,
                moneyAmt: int.parse(money)));
          else
            _database.addRecord(Record(
                debtorUid: friendUid,
                description: _description,
                loanerUid: widget.userUid,
                moneyAmt: int.parse(money)));
        },
        child: Text("Submit", textAlign: TextAlign.center));

    final chooseTypeDropdown = new DropdownButton(
        value: _type,
        items: [
          DropdownMenuItem(child: Text("You owe"), value: "Debt"),
          DropdownMenuItem(child: Text("Owes you"), value: "Loaned")
        ],
        onChanged: (value) {
          setState(() {
            _type = value;
          });
        });

    return Scaffold(
      appBar: AppBar(title: Text("Add Record")),
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: _formKey,
                child: ListView(shrinkWrap: true,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      chooseTypeDropdown,
                      chooseFriendDropdown,
                      SizedBox(height: 20.0),
                      friend != null
                          ? Text(friend.fname +
                              " " +
                              friend.lname +
                              " (" +
                              friend.email +
                              ")")
                          : Text("No User selected"),
                      moneyTextField,
                      descriptionTextField,
                      submitButton
                    ]))),
      ),
    );
  }
}
