import 'package:flutter/material.dart';

import 'divider_container.dart';

class ContainerDividerWithPadding extends StatelessWidget {
  const ContainerDividerWithPadding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: DividerContainer(
        // height: 2,
        height: MediaQuery.of(context).size.height * 0.003,
        color: Colors.orangeAccent,
        width: double.infinity,
      ),
    );
  }
}

class DrawerListTerms extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? colorText;
  final String drawerText;
  const DrawerListTerms({
    super.key,
    required this.drawerText,
    required this.onTap,
    required this.icon,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.orangeAccent,
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.orangeAccent,
          size: 25,
        ),
        title: Text(
          drawerText,
          style: TextStyle(
            color: colorText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
