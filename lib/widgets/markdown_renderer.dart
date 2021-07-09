import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:noted/constants/constants.dart';

class MarkDownRender extends StatelessWidget {
  final String? text;
  MarkDownRender({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text!.isEmpty
        ? Center(
            child: Text(
              "Sorry, no preview available",
              style: standardtextStyle,
            ),
          )
        : Markdown(
            padding: EdgeInsets.zero,
            data: text!,
          );
  }
}
