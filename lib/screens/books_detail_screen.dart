import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/models/books.dart';
import 'package:noted/screens/note_adding_screen.dart';
import 'package:noted/services/book_service.dart';
import 'package:noted/widgets/description_input.dart';
import 'package:noted/widgets/list_of_notes.dart';
import 'package:noted/widgets/name_input.dart';
import 'package:noted/widgets/toaster_button.dart';
import 'package:provider/provider.dart';

class BooksDetailScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  static const routeName = '/booksdetail';

  BooksDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Books;

    titleController.text = args.title!;
    descriptionController.text = args.description!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
        title: Text(
          "Notes",
          style: titleStyle,
        ),
        actions: [
          ToasterButton(
            titleController: titleController,
            descriptionController: descriptionController,
            books: args,
          ),
          IconButton(
            onPressed: () {
              Provider.of<BookService>(
                context,
                listen: false,
              ).deleteBook(args);

              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete_outlined),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              nameInput(titleController, false),
              descriptionInput(descriptionController),
              vertiCalSpace,
              ListOfNotes(
                books: args,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(NoteEditor.routeName, arguments: args),
        child: Icon(Icons.add_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
