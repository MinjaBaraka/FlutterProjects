import 'package:flutter/material.dart';

class DividerContainer extends StatelessWidget {
  final double height;
  final double? width;
  final Color? color;
  final Widget? child;
  const DividerContainer({
    super.key,
    required this.height,
    this.color,
    this.child, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}
