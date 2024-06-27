import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const Center(
        child: Text("Ticket"),
      ),
    );
  }
}
