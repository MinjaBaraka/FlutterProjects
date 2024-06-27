import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeGridListWidget extends StatelessWidget {
  final IconData icon;
  final String lgName;
  final String smName;
  final VoidCallback? onTap;

  const WelcomeGridListWidget({
    super.key,
    required this.icon,
    required this.lgName,
    required this.smName,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 1.00,
        width: MediaQuery.of(context).size.width * 1.85,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: [
              Colors.black38,
              Colors.grey,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.orangeAccent,
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: lgName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: smName,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
