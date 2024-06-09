import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: const Color(0xffdd0000),
    inversePrimary: Colors.red,
    secondary: Colors.grey.shade200,
  ),
);
