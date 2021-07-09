import 'package:flutter/material.dart';
import 'package:noted/models/books.dart';
import 'package:noted/services/book_service.dart';
import 'package:noted/widgets/description_input.dart';
import 'package:noted/widgets/name_input.dart';
import 'package:provider/provider.dart';

class CreateBookForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  CreateBookForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        nameInput(titleController, true),
        descriptionInput(descriptionController),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.cancel_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  Books book = Books(
                    title: titleController.text,
                    description: descriptionController.text,
                    creationDate: DateTime.now(),
                  );

                  Provider.of<BookService>(
                    context,
                    listen: false,
                  ).addBooks(book);

                  Navigator.of(context).pop();
                }

                DoNothingAction();
              },
              icon: Icon(
                Icons.save_alt_outlined,
              ),
            )
          ],
        )
      ],
    );
  }
}
