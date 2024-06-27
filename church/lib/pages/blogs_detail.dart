import 'package:church/model/blogs_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BlogsDetail extends StatefulWidget {
  final int index;
  const BlogsDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<BlogsDetail> createState() => _BlogsDetailState();
}

class _BlogsDetailState extends State<BlogsDetail> {
  @override
  Widget build(BuildContext context) {
    final blogsList = BlogsList.blogsList[widget.index];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.orangeAccent,
                          size: 35,
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Text(
                      "Blog Detail",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),

              //Container + Image + word

              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  image: DecorationImage(
                    image: AssetImage(blogsList.imageBlog),
                    fit: BoxFit.cover,
                  ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 120),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orangeAccent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orangeAccent.withOpacity(0.6),
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                              ),
                            ],
                          ),
                          child: Text(
                            blogsList.lgText,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //End Container + Image + word

              const Gap(15),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              blogsList.smText,
                              style: const TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              blogsList.calendarText,
                              style: const TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.44,
                          child: ListView(
                            children: [
                              Text(
                                blogsList.paragraphInfoBlogs,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
