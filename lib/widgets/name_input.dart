import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';

Widget nameInput(TextEditingController titleController, bool autofocus) {
  return TextFormField(
    controller: titleController,
    autofocus: autofocus,
    cursorColor: Colors.teal,
    autocorrect: true,
    style: whiteTitleStyle,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'title',
      hintStyle: whiteTitleStyle,
    ),
  );
}
