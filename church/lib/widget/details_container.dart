import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsContainer extends StatelessWidget {
  final IconData icon;
  final String smText;
  final String lgText;
  const DetailsContainer({
    super.key,
    required this.icon,
    required this.smText,
    required this.lgText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.orangeAccent,
        ),
        const Gap(30),
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: smText,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: lgText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
