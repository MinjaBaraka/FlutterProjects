import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BooksModel extends Equatable {
  final String urlImg;
  final String appLargeText;
  final String appSmallerText;

  BooksModel({
    required this.urlImg,
    required this.appLargeText,
    required this.appSmallerText,
  });

  List<BooksModel> bookModel = [
    BooksModel(
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
