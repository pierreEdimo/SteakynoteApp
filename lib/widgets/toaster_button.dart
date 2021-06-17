import 'package:flutter/material.dart';
import 'package:noted/models/books.dart';
import 'package:noted/services/book_service.dart';
import 'package:noted/widgets/show_snack.dart';
import 'package:provider/provider.dart';

class ToasterButton extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Books? books;
  ToasterButton(
      {Key? key, this.titleController, this.descriptionController, this.books})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (titleController!.text.isNotEmpty) {
          Books editedBook = books!;
          editedBook.title = titleController!.text;
          editedBook.description = descriptionController!.text;
          editedBook.creationDate = DateTime.now();

          Provider.of<BookService>(context, listen: false).editBook(editedBook);

          showSnack(context, "Edits saved");
        }
        DoNothingAction();
      },
      icon: Icon(Icons.save_alt_outlined),
    );
  }
}
