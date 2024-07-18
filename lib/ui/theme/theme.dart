import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.red[600],
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent, primary: Colors.red[600]!, brightness: Brightness.dark),
  scaffoldBackgroundColor: Colors.black,
  dividerTheme: DividerThemeData(
    color: Colors.grey[300],
  ),
  textTheme: textTheme,
  cardColor: Color(0xFF231111),
  canvasColor: Color(0xFF231111),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.red[600],
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent, primary: Colors.red[600]!, brightness: Brightness.light),
  scaffoldBackgroundColor: Colors.grey[200],
  dividerTheme: DividerThemeData(
    color: Colors.grey[300],
  ),
  textTheme: textTheme,
  cardColor: Colors.white,
  canvasColor: Colors.white,
);


final textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  ),
);

extension ThemePlatformExtension on ThemeData{
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  Color get dangerActionColor => Colors.red[600]!;
}