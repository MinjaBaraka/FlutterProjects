import 'package:church/model/blogs_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widget/drawer_list_page.dart';
import 'blogs_detail.dart';

class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  // final List<BlogsList> blogsList;
  // const BlogsPage({Key? key, required this.blogsList}) : super(key: key);

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
                      "Blogs",
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
                  itemCount: BlogsList.blogsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogsDetail(index: index),
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
                                        image: AssetImage(BlogsList
                                            .blogsList[index].imageBlog),
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
                                                  BlogsList
                                                      .blogsList[index].smText,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  BlogsList.blogsList[index]
                                                      .calendarText,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
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
                                                  BlogsList
                                                      .blogsList[index].lgText,
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
                                                    BlogsList.blogsList[index]
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
