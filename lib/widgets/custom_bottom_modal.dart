import 'package:flutter/material.dart';

showCustomModal(BuildContext context, Widget child) {
  return showModalBottomSheet<void>(
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: child),
      ),
    ),
  );
}
