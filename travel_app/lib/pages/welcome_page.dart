// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var image in images) {
        precacheImage(AssetImage("assets/welcome/" + image), context);
      }
    });
  }

  List images = [
    "3.jpg",
    "2.jpg",
    "3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/welcome/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 105, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Column that containing the text and Responsive Button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut quis porttitor erat. Ut odio magna, laoreet id velit id, ultricies aliquet odio. Aenean eu finibus mi. Nullam fringilla ac lectus quis porta.",
                            color: Colors.black45,
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Responsive Button
                        ResponsiveButton(
                          width: 120,
                        ),
                      ],
                    ),
                    // Responsvie Button at the Up-left of the corn
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
