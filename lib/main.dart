import 'package:flutter/material.dart';
import 'package:smarthome_ui/home_screen.dart';
import 'package:smarthome_ui/util/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Appcolor.bgColor,
      ),
      home: const HomePage(),
    );
  }
}
