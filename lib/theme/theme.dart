import 'package:flutter/material.dart';

 ThemeData theme() {

       return ThemeData( textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 21,  color: Colors.white, fontFamily: 'Bungee'
              ),
          displayMedium: TextStyle(
              fontSize: 17,   color: Colors.white, 
              fontFamily: 'Bungee'
              ),
          displaySmall: TextStyle(
            fontFamily: 'Bungee', fontSize: 18
            )
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
        ),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color.fromARGB(255, 47, 46, 51)),
        //
        primaryColor: Color.fromARGB(202, 106, 139, 167),
        //
        scaffoldBackgroundColor: Color.fromARGB(255, 47, 46, 51),
        //
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 81, 81),
         titleTextStyle: TextStyle(fontFamily: 'Bungee', fontSize: 18) ),
        //
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 255, 81, 81)
            ),
        cardTheme: CardTheme(color: Color.fromARGB(206, 93, 96, 105)
        ),);
        
        }