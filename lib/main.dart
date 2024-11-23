import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.deepPurple.shade300,
    primaryColor: deepPurpleColor,
    textTheme:const TextTheme(bodyMedium: TextStyle(color: whiteColor, fontSize: 15))
      ),
      home:  HomeScreen()
    );
  }
}

