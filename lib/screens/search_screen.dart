import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/screens/note_editing_screen.dart';
import 'package:noted/services/note_service.dart';
import 'package:noted/widgets/note_container.dart';

class SearchScreen extends SearchDelegate<String> {
  late NoteService? _noteService = NoteService();
  late List<SteakyNote> _notes = <SteakyNote>[];

  _fetchNotes() {
    return _notes = _noteService!.fetchAllNotes();
  }

  SearchScreen() {
    _notes = _noteService!.fetchAllNotes();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close_outlined)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.keyboard_arrow_left_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _queryNotes(query, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _queryNotes(query, context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(elevation: 0),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        border: InputBorder.none,
      ),
    );
  }

  @override
  String get searchFieldLabel => "search a note";

  _queryNotes(
    String query,
    BuildContext context,
  ) {
    if (query.isNotEmpty) {
      final notes =
          _notes.where((x) => x.content!.contains(query.toLowerCase()));

      return notes.isEmpty
          ? Center(
              child: Text(
                '$query not found',
                style: standardtextStyle,
              ),
            )
          : ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              children: notes
                  .map((SteakyNote note) => GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(EditNoteScreen.routeName,
                                arguments: note)
                            .then((_) => _fetchNotes()),
                        child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: noteContainer(note, note.key, context)),
                      ))
                  .toList(),
            );
    } else {
      return Container();
    }
  }
}
