import 'package:flutter/material.dart';
import 'package:noted/models/books.dart';
import 'package:noted/services/book_service.dart';
import 'package:noted/widgets/books_container.dart';
import 'package:provider/provider.dart';

class ListOfbooks extends StatelessWidget {
  const ListOfbooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(builder: (context, bookService, child) {
      List<Books> books = bookService.fetchBooks();
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: books.length < 1
            ? Center(
                child: Text(
                  "No Books yet '\n'" + ", please tap '+' to create a new one",
                  textAlign: TextAlign.center,
                ),
              )
            : ListView(
                children: books
                    .map(
                      (Books book) => Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: BooksContainer(
                          books: book,
                          id: book.key,
                        ),
                      ),
                    )
                    .toList(),
              ),
      );
    });
  }
}
