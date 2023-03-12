import 'package:good_reader/models/book.dart';

abstract class BookState {}

class BookInitialState extends BookState {}

class BookLoadingState extends BookState {}

class BookLoadedState extends BookState {
  final List<Book> books;

  BookLoadedState({required this.books});
}
