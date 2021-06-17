import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/models/books.dart';
import 'package:intl/intl.dart';
import 'package:noted/screens/books_detail_screen.dart';

class BooksContainer extends StatefulWidget {
  final Books? books;
  final int? id;
  const BooksContainer({Key? key, this.books, this.id}) : super(key: key);

  @override
  _BooksContainerState createState() => _BooksContainerState();
}

class _BooksContainerState extends State<BooksContainer> {
  @override
  Widget build(BuildContext context) {
    final color = lightColors[widget.id! % lightColors.length];
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        BooksDetailScreen.routeName,
        arguments: widget.books,
      ),
      child: Card(
        color: color,
        child: Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.menu_book_outlined),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.books!.title!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        widget.books!.description!.isEmpty
                            ? Text(
                                "No description added",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              )
                            : Text(
                                widget.books!.description!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Flexible(
                    child: widget.books!.creationDate == null
                        ? Text("")
                        : Text(
                            DateFormat.yMMMd()
                                .format(widget.books!.creationDate!),
                            style: TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
