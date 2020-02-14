import 'package:flutter/material.dart';
import 'package:flutter_unsplash/ui/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
      ),
      home: HomeScreen(title: 'Unsplash'),
    );
  }
}
