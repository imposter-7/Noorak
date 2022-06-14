// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lastversion/mainpage.dart';
//import 'package:responsive_framework/responsive_framework.dart';

//sethompage back the defult but now test the smart page
//import 'Home.dart';

void main() {
  runApp(const MaterialApp(home: MainPage()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,

      title: 'Home',
supportedLocales: [
    Locale('en', 'US'), // English, no country code
    Locale('ar', 'JO'), // Spanish, no country code
  ],
      home: MainPage(),


    );
  }
}