import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:noted/constants/constants.dart';
import 'package:noted/models/steaky_notes.dart';

Widget noteContainer(SteakyNote note, int index, BuildContext context) {
  final minHeight = getMinHeight(index);
  final color = lightColors[note.key % lightColors.length];
  return Card(
    color: color,
    child: Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints(maxHeight: minHeight),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              DateFormat.yMMMd().format(note.creationDate!),
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
          ),
          Expanded(
            child: Markdown(
              padding: EdgeInsets.zero,
              styleSheet: MarkdownStyleSheet(
                h1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                p: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              data: note.content!,
            ),
          ),
        ],
      ),
    ),
  );
}
