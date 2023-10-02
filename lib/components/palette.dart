import 'package:flutter/material.dart';

class Palette {
  static MaterialColor lightGreenM = const MaterialColor(0xffe11e26, <int, Color>{
    50: Color.fromRGBO(126, 180, 41, .1),
    100: Color.fromRGBO(126, 180, 41, .2),
    200: Color.fromRGBO(126, 180, 41, .3),
    300: Color.fromRGBO(126, 180, 41, .4),
    400: Color.fromRGBO(126, 180, 41, .5),
    500: Color.fromRGBO(126, 180, 41, .6),
    600: Color.fromRGBO(126, 180, 41, .7),
    700: Color.fromRGBO(126, 180, 41, .8),
    800: Color.fromRGBO(126, 180, 41, .9),
    900: Color.fromRGBO(126, 180, 41, 1),
  });

  static const Color lightGreen = Color.fromRGBO(126, 180, 41, 1);

  static MaterialColor greenM = const MaterialColor(0xffe11e26, <int, Color>{
    50: Color.fromRGBO(61, 163, 47, .1),
    100: Color.fromRGBO(61, 163, 47, .2),
    200: Color.fromRGBO(61, 163, 47, .3),
    300: Color.fromRGBO(61, 163, 47, .4),
    400: Color.fromRGBO(61, 163, 47, .5),
    500: Color.fromRGBO(61, 163, 47, .6),
    600: Color.fromRGBO(61, 163, 47, .7),
    700: Color.fromRGBO(61, 163, 47, .8),
    800: Color.fromRGBO(61, 163, 47, .9),
    900: Color.fromRGBO(61, 163, 47, 1),
  });

  static const Color green = Color.fromRGBO(61, 163, 47, 1);
  static const Color brightGreen = Color.fromRGBO(214, 255, 214, 1);

  static MaterialColor lightGreyM = const MaterialColor(0xffe11e26, <int, Color>{
    50: Color.fromRGBO(250, 250, 250, .1),
    100: Color.fromRGBO(250, 250, 250, .2),
    200: Color.fromRGBO(250, 250, 250, .3),
    300: Color.fromRGBO(250, 250, 250, .4),
    400: Color.fromRGBO(250, 250, 250, .5),
    500: Color.fromRGBO(250, 250, 250, .6),
    600: Color.fromRGBO(250, 250, 250, .7),
    700: Color.fromRGBO(250, 250, 250, .8),
    800: Color.fromRGBO(250, 250, 250, .9),
    900: Color.fromRGBO(250, 250, 250, 1),
  });

  static const Color lightGrey = Color.fromRGBO(250, 250, 250, 1);
  static const Color mediumGrey = Color.fromRGBO(235, 235, 235, 1);
  static const Color grey = Color.fromRGBO(158, 158, 158, 1);
  static const Color darkGrey = Color.fromRGBO(97, 97, 97, 1);

  static const Color yellow = Color.fromRGBO(255, 192, 45, 1);

  static const Color orange = Color.fromRGBO(251, 148, 0, 1);

  static Gradient greenGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      green,
      lightGreen,
    ],
  );

  static Gradient greenButtonGradient = const RadialGradient(
    radius: 5,
    colors: [
      Color.fromRGBO(61, 163, 47, 1),
      Color.fromRGBO(126, 180, 41, 1),
    ],
  );
}
