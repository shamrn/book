import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class FavoriteBookDataSource {
  void add({required int bookId});

  void remove({required int bookId});

  List<int> getIds();
}

class FavoriteBooksLocalDataSourceImpl implements FavoriteBookDataSource {
  static const _boxName = 'favoriteBooksBox';
  late final Box _favoriteBooksBox;

  FavoriteBooksLocalDataSourceImpl() {
    _initDB();
  }

  @override
  void add({required int bookId}) async {
    await _favoriteBooksBox.add(bookId);
  }

  @override
  void remove({required int bookId}) async {
    await _favoriteBooksBox
        .deleteAt(_favoriteBooksBox.values.toList().indexOf(bookId));
  }

  @override
  List<int> getIds() {
    return _favoriteBooksBox.values.cast<int>().toList();
  }

  void _initDB() async {
    _favoriteBooksBox = Hive.box(_boxName);
  }
}
