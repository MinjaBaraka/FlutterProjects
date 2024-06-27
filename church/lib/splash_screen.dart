import 'dart:async';

import 'package:church/auth/login_auth.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginAuth(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/splash/1.png",
                  height: 300,
                  width: 300,
                  // fit: BoxFit.cover,
                ),
                const Gap(5),
                const Text(
                  "Arusha Church",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(60),
              ],
            ),
            const CircularProgressIndicator(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
