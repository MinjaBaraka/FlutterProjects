import 'package:church/pages/blogs_page.dart';
import 'package:church/pages/books.detail.dart';
import 'package:church/pages/events_screen.dart';
import 'package:church/pages/personal_account.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../model/blogs_list.dart';
import '../model/upcoming_events.dart';
import '../widget/welcome_grid_widget.dart';
import 'prayer_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<BlogsList>? blogsList;
  List<EventsUpcoming>? eventsUpcoming;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Arusha Church",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    splashColor: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PesornalAccount(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Thought of the Day",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Text(
                    "At the end of the day,Before close your eyes,be content with what you've done and be proud of who you are",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Column(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 190 / 100,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: [
                      WelcomeGridListWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EventsScreen(),
                              ));
                        },
                        icon: Icons.event,
                        lgName: "Event\n",
                        smName: "List of Event",
                      ),
                      WelcomeGridListWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BlogsPage(),
                              ));
                        },
                        icon: Icons.list_alt,
                        lgName: "Blogs\n",
                        smName: "List of Blogs",
                      ),
                      WelcomeGridListWidget(
                        icon: Icons.hail_outlined,
                        lgName: "Prayer\n",
                        smName: "List of Event",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PrayerScreen(),
                              ));
                        },
                      ),
                       WelcomeGridListWidget(
                        icon: Icons.book_outlined,
                        lgName: "Books\n",
                        smName: "List of Books",
                        onTap: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookLibray(),
                              ));
                        },
                      ),
                      const WelcomeGridListWidget(
                        icon: Icons.collections,
                        lgName: "Gallery\n",
                        smName: "List of Gallery",
                      ),
                      const WelcomeGridListWidget(
                        icon: Icons.search,
                        lgName: "Find a Church\n",
                        smName: "Find the location of church",
                      ),
                      const WelcomeGridListWidget(
                        icon: Icons.event,
                        lgName: "About\n",
                        smName: "About the church",
                      ),
                      const WelcomeGridListWidget(
                        icon: Icons.email,
                        lgName: "Contact\n",
                        smName: "Manager a church",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
