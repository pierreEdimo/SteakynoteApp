import 'package:flutter/material.dart';
import 'package:noted/services/Editing_service.dart';
import 'package:noted/widgets/markdown_renderer.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left_outlined,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<EditingService>(
        builder: (context, textService, child) {
          String text = textService.getText();

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: MarkDownRender(
              text: text,
            ),
          );
        },
      ),
    );
  }
}
