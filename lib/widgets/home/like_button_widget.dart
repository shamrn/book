import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_bloc.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_event.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final int bookId;
  final bool isFavorite;

  const FavoriteButtonWidget(
      {Key? key, required this.bookId, required this.isFavorite})
      : super(key: key);

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget>
    with SingleTickerProviderStateMixin {
  static const Color _color = Color(0xFFFF2D20);
  static const double _size = 24;

  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 100), vsync: this, value: 1.0);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteBooksBloc bloc = context.read<FavoriteBooksBloc>();
    return GestureDetector(
      onTap: () {
        if (!widget.isFavorite) {
          bloc.add(FavoriteBooksSetEvent(bookId: widget.bookId));
        } else {
          bloc.add(FavoriteBooksUnSetEvent(bookId: widget.bookId));
        }
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.linear)),
        child: widget.isFavorite
            ? const Icon(
                Icons.favorite,
                size: _size,
                color: _color,
              )
            : const Icon(Icons.favorite_border, size: _size, color: _color),
      ),
    );
  }
}
