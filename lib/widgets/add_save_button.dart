import 'package:flutter/material.dart';
import 'package:noted/models/books.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/services/note_service.dart';
import 'package:noted/widgets/show_snack.dart';
import 'package:provider/provider.dart';

Widget saveButton(TextEditingController controller, int id,
    BuildContext context, Books books) {
  return Container(
    alignment: Alignment.bottomRight,
    child: IconButton(
      icon: Icon(
        Icons.save_outlined,
      ),
      onPressed: () {
        if (controller.text.isNotEmpty) {
          SteakyNote newNote = SteakyNote(
            content: controller.text,
            creationDate: DateTime.now(),
            booKey: id,
          );

          Provider.of<NoteService>(context, listen: false).createNote(newNote);

          controller.clear();

          showSnack(context, "Saved");

          Navigator.of(context).pop();
        }
        DoNothingAction();
      },
    ),
  );
}
