 import 'package:flutter/material.dart';
 
 TableRow buildTableRow(String labelText, Widget inputField) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 25.0),
          child: Text(
            labelText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 4.0, top: 8.0, right: 4.0, bottom: 8.0),
          child: Container(
            child: inputField,
          ),
        ),
      ],
    );
  }