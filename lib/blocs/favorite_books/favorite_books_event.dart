abstract class FavoriteBooksEvent {}

class FavoriteBooksLoadEvent extends FavoriteBooksEvent {}

class FavoriteBooksSetEvent extends FavoriteBooksEvent {
  int bookId;

  FavoriteBooksSetEvent({required this.bookId});
}

class FavoriteBooksUnSetEvent extends FavoriteBooksEvent {
  int bookId;

  FavoriteBooksUnSetEvent({required this.bookId});
}
