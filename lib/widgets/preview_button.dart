import 'package:flutter/material.dart';
import 'package:noted/services/Editing_service.dart';
import 'package:provider/provider.dart';

Widget reviewButton(TextEditingController controller, BuildContext context) {
  return IconButton(
    onPressed: () {
      Provider.of<EditingService>(
        context,
        listen: false,
      ).addtext(controller.text);

      Navigator.of(context).pushNamed('/preview');
    },
    icon: Icon(
      Icons.remove_red_eye_outlined,
    ),
  );
}
