import 'package:flutter/cupertino.dart';
import 'package:noted/Boxes.dart';
import 'package:noted/models/books.dart';

class BookService extends ChangeNotifier {
  final _booksBox = Boxes.getBooks();
  late int taskCount;

  fetchBooks() {
    List<Books> books = <Books>[];
    books = _booksBox.values.toList();
    return books;
  }

  addBooks(Books books) {
    _booksBox.add(books);
    notifyListeners();
  }

  deleteBook(Books books) {
    books.delete();
    notifyListeners();
  }

  editBook(Books books) {
    books.save();
    notifyListeners();
  }
}
