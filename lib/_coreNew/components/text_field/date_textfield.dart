import 'package:flutter/material.dart';

class DateTextField extends StatelessWidget {
  const DateTextField({
    super.key,
    required this.hintTextTarih,
  });

  final String hintTextTarih;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintTextTarih,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}