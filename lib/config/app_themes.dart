import 'package:flutter/material.dart';

const Color customerColor = Color(0xFF49149f);
const Color gradientColor1 = Color.fromARGB(255, 3, 148, 6);
const Color gradientColor2 = Color.fromARGB(255, 30, 234, 19);
const List<Color> colorThemes = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.yellow,
];

class AppThemes {
  final int selectedColor;
  AppThemes({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < colorThemes.length,
        'Colors must be between 0 and ${colorThemes.length}',
      );

  ThemeData theme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorThemes[selectedColor],
  );
}
