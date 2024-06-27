import 'package:flutter/material.dart';
// import 'package:travel_app/pages/detail_page.dart';
// import 'package:travel_app/pages/navpages/main_page.dart';

import 'pages/navpages/main_page.dart';
import 'pages/welcome_page.dart';

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
      title: 'Travell App',
      theme: ThemeData(),
      home: const MainPage(),
      // home: const WelcomePage(),
      // home: const DetailPage(),
    );
  }
}
