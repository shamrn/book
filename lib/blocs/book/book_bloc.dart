import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/book/book_event.dart';
import 'package:good_reader/blocs/book/book_state.dart';
import 'package:good_reader/models/book.dart';
import 'package:good_reader/services/book/repository.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitialState()) {
    on<BookLoadEvent>(_onBookLoad);
  }

  void _onBookLoad(BookLoadEvent event, Emitter<BookState> state) async {
    emit(BookLoadingState());
    final List<BookList> books = await BookRepository().getList();
    emit(BookLoadedState(books: books));
  }
}
