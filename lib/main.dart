import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/models/books.dart';
import 'package:noted/models/steaky_notes.dart';
import 'package:noted/screens/books_detail_screen.dart';
import 'package:noted/screens/home_screen.dart';
import 'package:noted/screens/note_adding_screen.dart';
import 'package:noted/screens/note_editing_screen.dart';
import 'package:noted/screens/preview_screen.dart';
import 'package:noted/services/Editing_service.dart';
import 'package:noted/services/book_service.dart';
import 'package:noted/services/note_service.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BooksAdapter());

  await Hive.openBox<Books>('books');

  Hive.registerAdapter(SteakyNoteAdapter());

  await Hive.openBox<SteakyNote>('notes');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
        ChangeNotifierProvider(create: (context) => EditingService()),
        ChangeNotifierProvider(create: (context) => NoteService())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primaryBlack,
          scaffoldBackgroundColor: Color(
            0xffb393e42,
          ),
          fontFamily: 'MontSerrat',
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.white, // This is a custom color variable
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          BooksDetailScreen.routeName: (context) => BooksDetailScreen(),
          NoteEditor.routeName: (context) => NoteEditor(),
          '/preview': (context) => PreviewScreen(),
          EditNoteScreen.routeName: (context) => EditNoteScreen(),
        },
      ),
    );
  }
}
