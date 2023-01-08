import 'package:contact_list/UI/CadastroPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'UI/HomePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primaryColor: Color.fromARGB(202, 106, 139, 167),
      scaffoldBackgroundColor: Color.fromARGB(255, 47, 46, 51),
      appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 81, 81)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color.fromARGB(255, 255, 81, 81)),
      cardTheme: CardTheme(color: Color.fromARGB(206, 93, 96, 105))
    ),
    
  ));

}