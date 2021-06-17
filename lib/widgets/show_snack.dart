import 'package:flutter/material.dart';

showSnack(BuildContext context, String content) {
  final snackBar = SnackBar(
    duration: Duration(seconds: 1),
    content: Text(content),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
