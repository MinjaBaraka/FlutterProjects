import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const Center(
        child: Text("Search"),
      ),
    );
  }
}
