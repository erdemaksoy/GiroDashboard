import 'package:flutter/material.dart';

class FormColumn extends StatelessWidget {
  final List<Widget> children;

  const FormColumn({Key? key,required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(flex: 1),
        Expanded(
          flex: 8,
          child: Column(
            children: this.children,
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
