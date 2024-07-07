import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';


class SearchField extends StatelessWidget {
  const SearchField({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller ,
      decoration: InputDecoration(
        hintText: "Search",
        helperStyle: TextStyle(
          color: context.colors.onError,fontSize: 15,
        ),
        fillColor: context.colors.primary,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        ),
        prefixIcon: Icon(Icons.search,color: context.colors.onError,)
      ),
    );
  }
}