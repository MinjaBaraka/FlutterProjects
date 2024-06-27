import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_app/utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good Morning", style: Styles.headLineStyle3),
                          const Gap(5),
                          Text(
                            "Book Ticket",
                            style: Styles.headLineStyle1,
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const Gap(40),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.10,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          const Gap(5),
                          Text("Search", style: Styles.headLineStyle4)
                        ],
                      ),
                    ),
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Flights",
                        style: Styles.headLineStyle2,
                      ),
                      InkWell(
                        onTap: () {
                          print("You are tapped");
                        },
                        child: Text(
                          "View all",
                          style: Styles.textStyle
                              .copyWith(color: Styles.primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
