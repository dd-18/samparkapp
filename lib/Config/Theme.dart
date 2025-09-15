import 'package:flutter/material.dart';
import 'package:samparkapp/Config/Colors.dart';

var lightTheme = ThemeData();

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: dPrimaryColor,
    onPrimary: dOnBackgroundColor,
    surface: dBackgroundColor,
    onSurface: dOnBackgroundColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: dOnContainerColor,
  ),
);
