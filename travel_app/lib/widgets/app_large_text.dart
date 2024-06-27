// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
