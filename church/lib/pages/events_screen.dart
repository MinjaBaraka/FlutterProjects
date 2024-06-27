import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../model/upcoming_events.dart';
import '../widget/divider_container.dart';
import '../widget/drawer_list_page.dart';
import '../widget/tab_indicator_with_painter.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerListPages(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 0.2,
                      spreadRadius: 0.2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.orangeAccent,
                          size: 32,
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Text(
                      "Events",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Gap(30),
                          const Expanded(
                            child: TextField(
                              cursorColor: Colors.orangeAccent,
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.orangeAccent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                controller: tabController,
                indicator:
                    CircleTabIndicator(color: Colors.orangeAccent, radius: 5),
                tabs: const [
                  Tab(
                    text: "Upcoming",
                  ),
                  Tab(
                    text: "Past",
                  ),
                ],
              ),
              const Gap(10),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemCount: EventsUpcoming.upcomingEvents.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.26,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 0.2,
                                  spreadRadius: 0.2,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Colors.orangeAccent,
                                      ),
                                      const Gap(10),
                                      Text(
                                        EventsUpcoming
                                            .upcomingEvents[index].dateEvents,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Gap(20),
                                      const Icon(
                                        Icons.timer_outlined,
                                        color: Colors.orangeAccent,
                                      ),
                                      const Gap(10),
                                      Text(
                                        EventsUpcoming
                                            .upcomingEvents[index].timeEvents,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Gap(20),
                                      const Icon(
                                        Icons.person,
                                        color: Colors.orangeAccent,
                                      ),
                                      const Gap(5),
                                      Expanded(
                                        child: Text(
                                          EventsUpcoming
                                              .upcomingEvents[index].agedEvents,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(10),
                                  DividerContainer(
                                    color: Colors.orangeAccent,
                                    height: MediaQuery.of(context).size.height *
                                        0.004,
                                  ),
                                  const Gap(20),
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Events Info\n",
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.bold,
                                                // fontSize: 20,
                                              ),
                                            ),
                                            TextSpan(
                                              text: EventsUpcoming
                                                  .upcomingEvents[index]
                                                  .lgHeaderInfoEvents,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(8),
                                  Expanded(
                                    child: Text(
                                      EventsUpcoming.upcomingEvents[index]
                                          .paragraphInfoEvents,
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Text("Baraka"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
