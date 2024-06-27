import 'package:church/auth/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../pages/welcome_page.dart';

class RegisterAuth extends StatefulWidget {
  const RegisterAuth({Key? key}) : super(key: key);

  @override
  State<RegisterAuth> createState() => _RegisterAuthState();
}

class _RegisterAuthState extends State<RegisterAuth> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/splash/1.png",
                          height: 300,
                          width: 300,
                          // fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.10,
                            decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "Arusha Church",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.10,
                            decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Gap(25),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.orangeAccent,
                    decoration: const InputDecoration(
                      hintText: "User Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color.fromARGB(255, 212, 212, 212),
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.orangeAccent,
                    decoration: const InputDecoration(
                      hintText: "Email Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color.fromARGB(255, 212, 212, 212),
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    obscureText: true,
                    cursorColor: Colors.orangeAccent,
                    decoration: const InputDecoration(
                      hintText: "Create Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color.fromARGB(255, 212, 212, 212),
                      filled: true,
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: Colors.orangeAccent,
                    ),
                  ),
                  const Gap(10),
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
                      minimumSize: const Size(double.infinity, 45),
                      backgroundColor: Colors.orangeAccent,
                      elevation: 0.0,
                    ),
                    child: const Text("Sign Up"),
                  ),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Already have an account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginAuth(),
                              ));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
