import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_event.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_state.dart';
import 'package:good_reader/services/favorite_books/data_source.dart';

class FavoriteBooksBloc extends Bloc<FavoriteBooksEvent, FavoriteBooksState> {
  static FavoriteBookDataSource _favoriteBookLocalDataSource =
      FavoriteBooksLocalDataSourceImpl();

  FavoriteBooksBloc() : super(FavoriteBooksInitialState()) {
    on<FavoriteBooksLoadEvent>(_onFavoriteBooksLoad);

    on<FavoriteBooksSetEvent>(_onFavoriteBooksSet);

    on<FavoriteBooksUnSetEvent>(_onFavoriteBooksUnSet);
  }

  bool isFavorite({required int bookId}) {
    bool isFavorite = false;

    if (state is FavoriteBooksLoadedState) {
      FavoriteBooksLoadedState state_ = state as FavoriteBooksLoadedState;
      isFavorite = state_.bookIds.contains(bookId);
    }

    return isFavorite;
  }

  void switching({required int bookId}) {
    if (state is FavoriteBooksLoadedState) {
      FavoriteBooksLoadedState state_ = state as FavoriteBooksLoadedState;
      bool isFavorite = state_.bookIds.contains(bookId);

      if (isFavorite) {
        add(FavoriteBooksUnSetEvent(bookId: bookId));
      } else {
        add(FavoriteBooksSetEvent(bookId: bookId));
      }
    }
  }

  void _onFavoriteBooksLoad(
      FavoriteBooksLoadEvent event, Emitter<FavoriteBooksState> state) {
    emit(FavoriteBooksLoadedState(
        bookIds: _favoriteBookLocalDataSource.getIds()));
  }

  void _onFavoriteBooksSet(
      FavoriteBooksSetEvent event, Emitter<FavoriteBooksState> state) {
    _favoriteBookLocalDataSource.add(bookId: event.bookId);
    add(FavoriteBooksLoadEvent());
  }

  void _onFavoriteBooksUnSet(
      FavoriteBooksUnSetEvent event, Emitter<FavoriteBooksState> state) {
    _favoriteBookLocalDataSource.remove(bookId: event.bookId);
    add(FavoriteBooksLoadEvent());
  }
}
