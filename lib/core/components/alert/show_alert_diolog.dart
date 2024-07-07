import 'package:flutter/material.dart';

import '../../model/response_model.dart';


showAlertDialog(BuildContext context, ResponseModel response) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: response.isSucced ? Colors.green : Colors.red,
    title: Text(response.title),
    content: Text(response.messagge),
    actions: [
      TextButton(
        child: Text("Ok"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
