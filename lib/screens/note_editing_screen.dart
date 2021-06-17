import 'package:flutter/material.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/services/note_service.dart';
import 'package:noted/widgets/edit_save_button.dart';
import 'package:noted/widgets/markdown_input.dart';
import 'package:noted/widgets/preview_button.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatelessWidget {
  static const routeName = '/editScreen';
  final TextEditingController _controller = TextEditingController();

  EditNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SteakyNote;
    _controller.text = args.content!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<NoteService>(
                context,
                listen: false,
              ).deleteNote(args);

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: markDownInput(_controller),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                reviewButton(_controller, context),
                editSaveButton(_controller, context, args)
              ],
            )
          ],
        ),
      ),
    );
  }
}
