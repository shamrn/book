import 'package:good_reader/models/author.dart';

class Book {
  int id;
  String name;
  String description;
  String imageUrl;
  DateTime releaseDate;
  Author author;
  Book(
      {required this.id,
      required this.name,
      required this.description,
        required this.imageUrl,
      required this.releaseDate,
      required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        releaseDate: DateTime.parse(json['releaseDate']),
        author: Author.fromJson(json['author']));
  }
}
