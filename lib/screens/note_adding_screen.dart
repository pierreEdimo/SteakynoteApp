import 'package:flutter/material.dart';
import 'package:noted/models/books.dart';
import 'package:noted/widgets/add_save_button.dart';
import 'package:noted/widgets/markdown_input.dart';
import 'package:noted/widgets/preview_button.dart';

class NoteEditor extends StatelessWidget {
  static const routeName = '/noteEditor';
  NoteEditor({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Books;

    //String text = Provider.of<EditingService>(context).getText();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
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
                reviewButton(
                  _controller,
                  context,
                ),
                saveButton(
                  _controller,
                  args.key,
                  context,
                  args,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
