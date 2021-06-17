import 'package:flutter/cupertino.dart';

class EditingService extends ChangeNotifier {
  String? text = "";

  void addtext(String value) {
    text = value;
    notifyListeners();
  }

  getText() {
    return text!;
  }
}
