import 'package:flutter/material.dart';
import 'package:news/providers/data.dart';
import 'package:news/screens/one_screen.dart';
import 'package:news/service/service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'News Application',
        debugShowCheckedModeBanner: false,
       darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,

        home: OneScreen(),
      ),
    );
  }
}
