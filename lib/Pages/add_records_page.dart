import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddRecordsPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final friendTextField = TextFormField();

  final moneyTextField = TextFormField(
    inputFormatters: <TextInputFormatter>[
      WhitelistingTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.singleLineFormatter
    ],
  );

  final descriptionTextField = TextFormField(
    maxLines: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Record")),
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: formKey,
                child: ListView(shrinkWrap: true,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      friendTextField,
                      moneyTextField,
                      descriptionTextField
                    ]))),
      ),
    );
  }
}
