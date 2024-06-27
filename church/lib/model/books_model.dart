import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String urlImg;
  final String appLargeText;
  final String appSmallerText;

  BookModel({
    required this.urlImg,
    required this.appLargeText,
    required this.appSmallerText,
  });

  List<BookModel> bookModel = [
    BookModel(
      urlImg: 'assets/blogs/3.jpg',
      appLargeText: 'The Story of the Bible',
      appSmallerText: 'Baraka G. Minja',
    ),
  ];

  @override
  List<Object?> get props => [
        urlImg,
        appLargeText,
        appSmallerText,
      ];
}
