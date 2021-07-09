import 'package:flutter/material.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/screens/note_editing_screen.dart';
import 'package:noted/services/note_service.dart';
import 'package:noted/widgets/markdown_renderer.dart';
import 'package:noted/widgets/show_snack.dart';
import 'package:provider/provider.dart';

class NoteDetailScreen extends StatelessWidget {
  static const routeName = "noteDetail";
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SteakyNote;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(
              EditNoteScreen.routeName,
              arguments: args,
            ),
            icon: Icon(
              Icons.edit_outlined,
            ),
          ),
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

              showSnack(context, 'deleted');

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: MarkDownRender(
          text: args.content,
        ),
      ),
    );
  }
}
