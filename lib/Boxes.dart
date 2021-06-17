import 'package:hive/hive.dart';
import 'package:noted/models/books.dart';
import 'package:noted/models/steaky_notes.dart';

class Boxes {
  static Box<Books> getBooks() => Hive.box<Books>('books');

  static Box<SteakyNote> getNotes() => Hive.box<SteakyNote>('notes');
}
