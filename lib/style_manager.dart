import 'package:flutter/material.dart';

class StyleManager {

  static const MaterialColor primaryPalette = const MaterialColor(0xFF505050,
      const<int, Color> {
        50: const Color(0xFFffffff),
        100: const Color(0xFFaaaaaa),
        200: const Color(0xFF909090),
        300: const Color(0xFF808080),
        400: const Color(0xFF707070),
        500: const Color(0xFF606060),
        600: const Color(0xFF505050),
        700: const Color(0xFF404040),
        800: const Color(0xFF303030),
        900: const Color(0xFF000000),
      });

  static const TextTheme textTheme = const TextTheme(
    display4: TextStyle(color: white),
    display3: TextStyle(color: white),
    display2: TextStyle(color: white),
    display1: TextStyle(color: white),
    headline: TextStyle(color: white),
    title: TextStyle(color: white),
    subhead: TextStyle(color: white),
    body2: TextStyle(color: white),
    body1: TextStyle(color: white),
    caption: TextStyle(color: white),
    button: TextStyle(color: white),
    subtitle: TextStyle(color: white),
    overline: TextStyle(color: white),
  );
  static const Color colorPrimary  = const Color(0xFF505050);
  static const Color colorPrimaryClicked = const Color(0xFF606060);
  static const Color primarySlightlyTransparent = const Color(0xD0606060);

  static const Color colorPrimaryDark = const Color(0xFF000000);
  static const Color colorAccent = const Color(0xFF6de873);
  static const Color colorAccentDark = const Color(0xFF9dd29f);
  static const Color background = const Color(0xFF303030);
  static const Color backgroundClicked = const Color(0xFF404040);
  static const Color white = const Color(0xFFffffff);
  static const Color faded = const Color(0xFFaaaaaa);

}