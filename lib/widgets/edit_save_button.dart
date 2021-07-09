import 'package:flutter/material.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/services/note_service.dart';
import 'package:noted/widgets/show_snack.dart';
import 'package:provider/provider.dart';

Widget editSaveButton(
  TextEditingController controller,
  BuildContext context,
  SteakyNote note,
) {
  return IconButton(
    onPressed: () {
      SteakyNote editedNote = note;
      editedNote.content = controller.text;
      editedNote.editedDate = DateTime.now();

      Provider.of<NoteService>(context, listen: false).editNote(editedNote);

      showSnack(context, "Edits saved");

      Navigator.of(context).pop();
    },
    icon: Icon(
      Icons.save_outlined,
      color: Colors.white,
    ),
  );
}
