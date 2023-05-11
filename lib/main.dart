import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testa/screens/calculator_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     const NotesPage = "NotesPage";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // primaryColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: CalculatorScreen(),
    );

  }
}
