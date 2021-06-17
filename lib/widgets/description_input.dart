import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';

Widget descriptionInput(TextEditingController descriptionController) {
  return TextFormField(
    controller: descriptionController,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    cursorColor: Colors.teal,
    style: standardtextStyle,
    maxLines: null,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'please provide a description',
      hintStyle: standardtextStyle,
    ),
  );
}
