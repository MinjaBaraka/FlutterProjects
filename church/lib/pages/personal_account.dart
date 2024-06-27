import 'package:church/auth/login_auth.dart';
import 'package:church/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/container_boxed.dart';

class PesornalAccount extends StatefulWidget {
  const PesornalAccount({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PesornalAccountState createState() => _PesornalAccountState();
}

class _PesornalAccountState extends State<PesornalAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginAuth(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(100),
              const ContainerBoxed(),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.0,
                ),
                child: const Text(
                  "Update Info",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
