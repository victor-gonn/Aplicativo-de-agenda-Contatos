import 'dart:ui';

import 'package:contact_list/UI/CadastroPage.dart';
import 'package:contact_list/blocs/bloc/contacts_bloc.dart';
import 'package:contact_list/helpers/contact_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/HomePage.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsBloc()..add(LoadContacts(
           contacts: <Contact>[]
            
          )),
        ),
        
      ],
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 21,  color: Colors.white, fontFamily: 'Bungee'
              ),
          headline2: TextStyle(
              fontSize: 17,   color: Colors.white, 
              fontFamily: 'Bungee'
              ),
          headline3: TextStyle(
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
        )
        ),
  ),
    );
  }
}