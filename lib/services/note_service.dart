import 'package:flutter/cupertino.dart';
import 'package:noted/Boxes.dart';
import 'package:noted/models/books.dart';
import 'package:noted/models/steaky_notes.dart';

class NoteService extends ChangeNotifier {
  final _noteBox = Boxes.getNotes();

  createNote(SteakyNote note) {
    _noteBox.add(note);
    notifyListeners();
  }

  editNote(SteakyNote note) {
    note.save();
    notifyListeners();
  }

  deleteNote(SteakyNote note) {
    note.delete();
    notifyListeners();
  }

  fetchNotes(Books books) {
    List<SteakyNote> notes = <SteakyNote>[];
    notes = _noteBox.values
        .where(
          (x) => x.booKey == books.key,
        )
        .toList();
    return notes;
  }

  fetchAllNotes() {
    List<SteakyNote> notes = <SteakyNote>[];
    notes = _noteBox.values.toList();
    return notes;
  }
}
