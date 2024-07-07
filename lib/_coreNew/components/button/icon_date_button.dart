import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class IconDateButton extends StatelessWidget {
  const IconDateButton({
    super.key,
    required this.onDateTimeChanged,
    required this.hintTextTarih,
  });

  final String hintTextTarih;
 final void Function(DateTime) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:  const Icon(Icons.calendar_today), 
      onPressed: () async {
        showCupertinoModalPopup<DateTime>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                minimumDate: DateTime(2000),
                maximumDate: DateTime(2101),
                onDateTimeChanged:onDateTimeChanged,
              ),
            ); 
       });
      },  
  );
  }
}