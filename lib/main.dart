// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          //primaryColor: Colors.blueAccent.shade700,
          scaffoldBackgroundColor: Color(0xFF37474F),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF102027),
          )),
      home: PriceScreen(),
    );
  }
}
