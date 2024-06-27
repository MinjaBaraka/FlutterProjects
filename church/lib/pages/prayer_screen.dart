import 'package:church/model/prayer_model.dart';
import 'package:church/pages/prayer_detail.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/drawer_list_page.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({Key? key}) : super(key: key);

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

// int expandedWidthContainer = 200;
// double expandedWidthContainer = 0;

bool isTapped = false;

class _PrayerScreenState extends State<PrayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerListPages(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              Container(
                height: 60,
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
                      "Prayer",
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
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: PrayerModel.prayerModel.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrayerDetails(index: index),
                          ),
                        );
                      },
                      splashColor: Colors.orangeAccent,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
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
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 15, left: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: AssetImage(PrayerModel
                                            .prayerModel[index].imageBlog),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  PrayerModel.prayerModel[index]
                                                      .smText,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.orangeAccent,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  PrayerModel.prayerModel[index]
                                                      .lgText,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    PrayerModel
                                                        .prayerModel[index]
                                                        .paragraphInfoBlogs,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
