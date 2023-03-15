import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_bloc.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final int bookId;

  const FavoriteButtonWidget({Key? key, required this.bookId})
      : super(key: key);

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget>
    with SingleTickerProviderStateMixin {
  static const Color _color = Color(0xFFFF2D20);
  static const double _width = 21;
  static const double _height = 18.75;

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
    bool isFavorite = bloc.isFavorite(bookId: widget.bookId);

    return GestureDetector(
        onTap: () {
          bloc.switching(bookId: widget.bookId);
          _controller.reverse().then((value) => _controller.forward());
        },
        child: ScaleTransition(
            scale: Tween(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(parent: _controller, curve: Curves.linear)),
            child: SvgPicture.asset(
              isFavorite
                  ? 'assets/icons/like_fill_icon.svg'
                  : 'assets/icons/like_icon.svg',
              width: _width,
              height: _height,
              colorFilter: const ColorFilter.mode(_color, BlendMode.srcIn),
            )));
  }
}
