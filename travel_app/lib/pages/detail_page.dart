import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome/1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 70,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Picture",
                          color: Colors.black54,
                        ),
                        AppLargeText(
                          text: "\$ 250",
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 5),
                        AppText(
                          text: "Arusha, Arusha Technical College",
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? Colors.amber
                                  : Colors.black54,
                            );
                          }),
                        ),
                        const SizedBox(width: 10),
                        AppText(
                          text: "(4.0)",
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
