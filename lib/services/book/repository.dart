import 'package:good_reader/models/book.dart';
import 'package:good_reader/services/book/provider.dart';

class BookRepository {
  final BookProvider _bookProvider = BookProvider();

  Future<List<Book>> getBooks() => _bookProvider.getBooks();
}
