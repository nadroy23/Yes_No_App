import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorTheme = [
  _customColor,
  Colors.black12,
  Colors.white24,
  Colors.cyan,
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            "El index del color debe estar entre 0 y ${_colorTheme.length}");

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      //brightness: Brightness.dark
    );
  }
}
