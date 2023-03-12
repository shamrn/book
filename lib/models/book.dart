import 'package:good_reader/models/author.dart';

class BookList {
  int id;
  String name;
  String imageUrl;
  DateTime releaseDate;
  Author author;

  BookList(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.releaseDate,
      required this.author});

  factory BookList.fromJson(Map<String, dynamic> json) {
    return BookList(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        releaseDate: DateTime.parse(json['releaseDate']),
        author: Author.fromJson(json['author']));
  }
}
