

import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    primarySwatch:Colors.lightGreen,
    primaryColorDark:Color.fromARGB(255, 71, 40, 124),
    primaryColor:Color.fromARGB(255, 168, 133, 228),
    primaryColorLight: Color.fromARGB(255, 168, 133, 228),
    textTheme:  TextTheme(
            headline1: TextStyle(fontSize: 20,color: Colors.amber),
            headline2: TextStyle(fontSize: 10,color:Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(hintStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width:1,color: Colors.black,),),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width:3,color: Colors.black)),),
  );
}