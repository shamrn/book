import 'dart:math';

import 'package:good_reader/models/book.dart';

class BookProvider {
  var books = [
    {
      "id": 1,
      "name": "Rita Hayworth and Shawshank Redemption",
      "description": "Rita Hayworth and Shawshank Redemption is a novella by Stephen King from his 1982 collection Different Seasons, subtitled Hope Springs Eternal. The novella has also been published as a standalone short book. The story is entirely told by the character Red, in a narrative he claims to have been writing from September 1975 to January 1976, with an additional chapter added in spring 1977.",
      "releaseDate": "1982-12-03 12:16:33",
      "imageUrl":
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61Dk3RDghhL._AC_UF1000,1000_QL80_.jpg",
      "author": {"id": 1, "name": "Stephen King"}
    },
    {
      "id": 2,
      "name": "Pride and Prejudice",
      "description": "Pride and Prejudice is an 1813 novel of manners by Jane Austen. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.",
      "releaseDate": "1813-12-03 12:16:33",
      "imageUrl":
          "https://almabooks.com/wp-content/uploads/2016/10/9781847493699-391x600.jpg",
      "author": {"id": 2, "name": "Jane Austen"}
    },
    {
      "id": 3,
      "name": "The Goldfinch",
      "description": "The Goldfinch is a novel by the American author Donna Tartt. It won the 2014 Pulitzer Prize for Fiction, among other honors.[1] Published in 2013, it was Tartt's first novel since The Little Friend in 2002.[2]",
      "releaseDate": "2013-12-03 12:16:33",
      "imageUrl":
      "https://upload.wikimedia.org/wikipedia/en/e/eb/The_goldfinch_by_donna_tart.png",
      "author": {"id": 3, "name": "Donna Tartt"}
    },
  ];

  Future<List<Book>> getBooks() async {
    await Future.delayed(
        Duration(milliseconds: Random().nextInt(1500))); // Mock sleep
    return books.map((json) => Book.fromJson(json)).toList();
  }
}
