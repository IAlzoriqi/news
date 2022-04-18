import 'package:flutter/material.dart';
import 'package:news/screens/one_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Application',
      debugShowCheckedModeBanner: false,
     darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      home: OneScreen(),
    );
  }
}
