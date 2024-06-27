import 'package:church/auth/forgot_password_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'details_container.dart';

class ContainerBoxed extends StatelessWidget {
  const ContainerBoxed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Update Info",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      ),
                    );
                  },
                  child: const Text(
                    "change password",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
            const Gap(35),
            const DetailsContainer(
              icon: Icons.person,
              smText: "User Name\n",
              lgText: "Baraka G. Minja",
            ),
            const Gap(25),
            const DetailsContainer(
              icon: Icons.email,
              smText: "Email Address\n",
              lgText: "Arusha, Tanzania",
            ),
            const Gap(25),
            const DetailsContainer(
              icon: Icons.phone,
              smText: "Phone Number\n",
              lgText: "+255 622 660 722",
            ),
          ],
        ),
      ),
    );
  }
}
