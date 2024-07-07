import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key, required this.title, required this.svgSrc, required this.tap}) : super(key: key);

  final String title, svgSrc;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
       
      onTap: tap,
      horizontalTitleGap: 0.0,
      //leading: Image.asset(svgSrc,height: 20,),
      title: Text(title,style: TextStyle(color: context.colors.onPrimaryContainer),),
    );
  }
}