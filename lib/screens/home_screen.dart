import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/screens/search_screen.dart';
import 'package:noted/widgets/change_theme.dart';
import 'package:noted/widgets/create_book_form.dart';
import 'package:noted/widgets/custom_bottom_modal.dart';
import 'package:noted/widgets/list_of_books.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: titleStyle,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(),
            ),
            icon: Icon(Icons.search_outlined),
          ),
          ChangeTheme()
        ],
      ),
      body: ListOfbooks(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCustomModal(
          context,
          CreateBookForm(),
        ),
        child: Icon(
          Icons.add_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
