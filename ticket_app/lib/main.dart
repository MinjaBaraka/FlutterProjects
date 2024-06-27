import 'package:flutter/material.dart';

import 'utils/app_style.dart';
import 'screens/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket App',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const BottomBar(),
    );
  }
}
