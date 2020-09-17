import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(){

  final ThemeData themeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.grey[900],
    primaryColor: Colors.yellowAccent,
    cardColor: Colors.grey[850],
    appBarTheme: AppBarTheme(
      color: Colors.grey[850],
      textTheme: GoogleFonts.montserratTextTheme()
    )
  );

  return themeData;
}