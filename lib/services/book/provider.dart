import 'dart:math';

import 'package:good_reader/models/book.dart';

class BookProvider {
  var bookList = [
    {
      "id": 1,
      "name": "Name name name name",
      "releaseDate": "2023-12-03 12:16:33",
      "imageUrl":
          "https://biblion.md/wp-content/uploads/2020/12/harry-potter-1-si-piatra-filozofala-rowling-ART.png",
      "author": {"id": 1, "name": "Author name"}
    },
    {
      "id": 2,
      "name": "Name name name name",
      "releaseDate": "2023-12-03 12:16:33",
      "imageUrl":
          "https://img.pikbest.com/templates/20210321/bg/5c2611c396af9.png!w700wp",
      "author": {"id": 2, "name": "Author name"}
    },
  ];

  Future<List<BookList>> getList() async {
    await Future.delayed(
        Duration(milliseconds: Random().nextInt(1500))); // Mock sleep
    return bookList.map((json) => BookList.fromJson(json)).toList();
  }
}
