// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_circle_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
