import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';

Widget markDownInput(TextEditingController? controller) {
  return TextFormField(
    controller: controller,
    maxLines: null,
    autofocus: true,
    textInputAction: TextInputAction.newline,
    cursorColor: Colors.teal,
    expands: true,
    style: standardtextStyle,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'what are you doing today',
      hintStyle: standardtextStyle,
    ),
  );
}
