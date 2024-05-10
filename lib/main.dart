import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'choosescreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'crypto',
      home: OptionScreen(),

    );
  }
}
