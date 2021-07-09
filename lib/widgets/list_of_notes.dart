import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/models/books.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/screens/note_detail_screen.dart';
import 'package:noted/services/note_service.dart';
import 'package:noted/widgets/note_container.dart';
import 'package:provider/provider.dart';

class ListOfNotes extends StatelessWidget {
  final Books? books;
  const ListOfNotes({Key? key, this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteService>(
      builder: (context, noteService, child) {
        List<SteakyNote> notes = noteService.fetchNotes(books!);

        return notes.isEmpty
            ? Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Text(
                    'there are 0 notes yet  \n tap "+" to create a new one',
                    textAlign: TextAlign.center,
                    style: standardtextStyle,
                  ),
                ),
              )
            : StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      NoteDetailScreen.routeName,
                      arguments: notes[index],
                    ),
                    child: noteContainer(notes[index], index, context),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
      },
    );
  }
}
