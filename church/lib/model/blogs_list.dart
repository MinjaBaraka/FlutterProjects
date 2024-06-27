import 'package:equatable/equatable.dart';

class BlogsList extends Equatable {
  // final VoidCallback? onTap;
  final String imageBlog;
  final String smText;
  final String lgText;
  final String paragraphInfoBlogs;
  final String calendarText;

  const BlogsList({
    // this.onTap,
    required this.smText,
    required this.lgText,
    required this.paragraphInfoBlogs,
    required this.calendarText,
    required this.imageBlog,
  });

  static List<BlogsList> blogsList = [
    const BlogsList(
      smText: "Arusha church",
      calendarText: "Sept 20, 2023",
      lgText: "Drawing Near To God Through Sanctification",
      imageBlog: "assets/blogs/1.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    const BlogsList(
      smText: "Arusha church",
      calendarText: "Jan 30, 2024",
      lgText: "Men, God's Control, and Self-Control",
      imageBlog: "assets/blogs/2.jpg",
      paragraphInfoBlogs:
          "In Flutter, creating such a layout can be done easily thanks to TabBar and TabBarView widgets.",
    ),
    const BlogsList(
      smText: "Arusha church",
      calendarText: "Feb 16, 2024",
      lgText: "12 Spurgeon Quotes on Fear and Faith",
      imageBlog: "assets/blogs/3.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    const BlogsList(
      smText: "Arusha church",
      calendarText: "March 05, 2024",
      lgText: "Drawing Near To God Through Sanctification",
      imageBlog: "assets/blogs/4.jpg",
      paragraphInfoBlogs:
          "In Flutter, creating such a layout can be done easily thanks to TabBar and TabBarView widgets.",
    ),
  ];

  @override
  List<Object?> get props => [
        smText,
        lgText,
        paragraphInfoBlogs,
        calendarText,
        imageBlog,
      ];
}
