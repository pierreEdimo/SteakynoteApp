import 'package:flutter/material.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF393e42),
    100: Color(0xFF393e42),
    200: Color(0xFF393e42),
    300: Color(0xFF393e42),
    400: Color(0xFF393e42),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF393e42),
    700: Color(0xFF393e42),
    800: Color(0xFF393e42),
    900: Color(0xFF393e42),
  },
);
const int _blackPrimaryValue = 0xFF393e42;

final lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
  Colors.amberAccent.shade100,
  Colors.blueAccent.shade100,
  Colors.blue.shade300,
  Colors.redAccent.shade100,
  Colors.teal.shade300,
  Colors.red.shade300,
  Colors.deepPurple.shade300,
  Colors.orangeAccent.shade100,
  Colors.limeAccent.shade100,
  Colors.indigo.shade300,
  Colors.cyan.shade300,
  Colors.purpleAccent.shade100,
];

const vertiCalSpace = SizedBox(
  height: 20.0,
);

TextStyle titleStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
);

TextStyle whiteTitleStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle standardtextStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.white,
);

double getMinHeight(int index) {
  switch (index % 4) {
    case 0:
      return 100;
    case 1:
      return 150;
    case 2:
      return 150;
    case 3:
      return 100;
    default:
      return 100;
  }
}
