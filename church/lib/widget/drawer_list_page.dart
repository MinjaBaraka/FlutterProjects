import 'package:church/pages/events_screen.dart';
import 'package:church/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../pages/blogs_page.dart';
import '../pages/books.detail.dart';
import '../pages/prayer_screen.dart';
import 'drawer_terms_diver.dart';

class DrawerListPages extends StatefulWidget {
  const DrawerListPages({
    super.key,
  });

  @override
  State<DrawerListPages> createState() => _DrawerListPagesState();
}

class _DrawerListPagesState extends State<DrawerListPages> {
  bool iseSelected = true;
  Color inActiveColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    child: Image.asset(
                      "assets/splash/1.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Arusha Church",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "arushachurch@gmail.com",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            DrawerListTerms(
              drawerText: "Back to Home",
              colorText: Colors.orangeAccent,
              icon: Icons.home,
              onTap: () {
                setState(() {
                  iseSelected == !iseSelected;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ));
              },
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Events",
              icon: Icons.event,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventsScreen(),
                    ));
              },
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Prayer",
              icon: Icons.hail_outlined,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrayerScreen(),
                    ));
              },
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Gallery",
              icon: Icons.collections,
              onTap: () {},
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Blogs",
              icon: Icons.list_alt,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BlogsPage(),
                  ),
                );
              },
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Books",
              icon: Icons.book_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookLibray(),
                  ),
                );
              },
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Find Church",
              icon: Icons.search,
              onTap: () {},
            ),
            const Gap(8),
            const ContainerDividerWithPadding(),
            const Gap(8),
            DrawerListTerms(
              drawerText: "Contact",
              icon: Icons.email,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
