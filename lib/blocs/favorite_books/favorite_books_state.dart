abstract class FavoriteBooksState {}

class FavoriteBooksInitialState extends FavoriteBooksState {}

class FavoriteBooksLoadingState extends FavoriteBooksState {}

class FavoriteBooksLoadedState extends FavoriteBooksState {
  List<int> bookIds;

  FavoriteBooksLoadedState({required this.bookIds});
}
