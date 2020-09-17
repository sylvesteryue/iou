import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddRecordsPage extends StatefulWidget {
  @override
  _AddRecordsPageState createState() => _AddRecordsPageState();
}

class _AddRecordsPageState extends State<AddRecordsPage> {
  final _formKey = GlobalKey<FormState>();

  String friend = '';
  String money = '';
  String description = '';
  String _type = '';

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

  // void searchUser(String searchText) {

  // }

  @override
  Widget build(BuildContext context) {
    final friendTextField = TextFormField();

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
        onChanged: (val) => setState(() => description = val));

    final submitButton = OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {},
        child: Text("Submit", textAlign: TextAlign.center));

    final chooseTypeDropdown = DropdownButton(
        value: _type,
        items: [
          DropdownMenuItem(child: Text("You owe"), value: "Debt"),
          DropdownMenuItem(child: Text("Owes you"), value: "Credit")
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
                      friendTextField,
                      moneyTextField,
                      descriptionTextField,
                      submitButton
                    ]))),
      ),
    );
  }
}
