import 'dart:ui';

import 'package:contact_list/UI/CadastroPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UI/HomePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white),
          headline2: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
        ),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color.fromARGB(255, 47, 46, 51)),
        primaryColor: Color.fromARGB(202, 106, 139, 167),
        scaffoldBackgroundColor: Color.fromARGB(255, 47, 46, 51),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 81, 81)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 255, 81, 81)),
        cardTheme: CardTheme(color: Color.fromARGB(206, 93, 96, 105))),
  ));
}
