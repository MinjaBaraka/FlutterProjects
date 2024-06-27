import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/drawer_list_page.dart';

class BookLibray extends StatelessWidget {
  const BookLibray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "Books",
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
              const Gap(20),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width * 0.38,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/blogs/3.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const Gap(4),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Story of The Bible",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(10),
                            Text(
                              "Baraka G Minja",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
