import 'package:equatable/equatable.dart';

class PrayerModel extends Equatable {
  final String imageBlog;
  final String smText;
  final String lgText;
  final String paragraphInfoBlogs;

  const PrayerModel({
    required this.imageBlog,
    required this.smText,
    required this.lgText,
    required this.paragraphInfoBlogs,
  });

  static List<PrayerModel> prayerModel = [
    const PrayerModel(
      smText: "Arusha church",
      lgText: "Prayers for Personal Situations",
      imageBlog: "assets/prayer/1.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    const PrayerModel(
      smText: "Arusha church",
      lgText: "Prayers for Life Events and Situations",
      imageBlog: "assets/prayer/2.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    const PrayerModel(
      smText: "Arusha church",
      lgText: "Prayers for the Armed Forces",
      imageBlog: "assets/prayer/3.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    const PrayerModel(
      smText: "Arusha church",
      lgText: "Prayers for the Armed Forces",
      imageBlog: "assets/prayer/4.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    const PrayerModel(
      smText: "Arusha church",
      lgText: "Prayers for Life Events and Situations",
      imageBlog: "assets/prayer/5.jpg",
      paragraphInfoBlogs:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
  ];
  @override
  List<Object?> get props => [
        imageBlog,
        smText,
        lgText,
        paragraphInfoBlogs,
      ];
}
