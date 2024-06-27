// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "1.jpg": "Picture",
    "2.jpg": "Travel",
    "3.jpg": "Phone",
    "13.jpg": "Car",
    "14.jpg": "CNG",
    "15.jpg": "Bike",
  };
  @override
  Widget build(BuildContext context) {
    // Below create an instance of TabController
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black,
                  ),
                  // Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Discover Text
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            const SizedBox(height: 30),
            // Create a Tab Bar
            // ignore: avoid_unnecessary_containers
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      const CircleTabIndicator(color: Colors.blue, radius: 4),
                  tabs: const [
                    Tab(
                      child: Text("Places"),
                    ),
                    Tab(
                      child: Text("Inspiration"),
                    ),
                    Tab(
                      child: Text("Emotions"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.infinity,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: const DecorationImage(
                            image: AssetImage("assets/welcome/1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  const Text("There"),
                  const Text("Bye"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore more",
                    size: 22,
                  ),
                  AppText(
                    text: "See all",
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              // margin: const EdgeInsets.only(left: 20),
              height: 120,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/welcome/${images.keys.elementAt(index)}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// create a circle tab indicator that will be painted after this class

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

// create a cirlce that will be painted with this code below

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
