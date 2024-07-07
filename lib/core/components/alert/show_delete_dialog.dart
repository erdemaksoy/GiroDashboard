import 'package:flutter/material.dart';

Future<bool> showDeleteDialog(BuildContext context) async {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: Colors.red,
    title: Text("Emin Misin?"),
    actions: [
      TextButton(
        child: Text("İptal Et"),
        onPressed: () {
          Navigator.pop(context, false);
        },
      ),
      TextButton(
        child: Text("Tamam"),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ],
  );

  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return result ?? false;
}
