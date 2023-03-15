import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_bloc.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/models/book.dart';

class BookDetailModalBottomSheetWidget {
  Book book;
  BuildContext context;

  late MediaQueryData _mediaData;
  late bool _orientationPortrait;
  late FavoriteBooksBloc _favoriteBooksBloc;

  BookDetailModalBottomSheetWidget(
      {required this.context, required this.book}) {
    _mediaData = MediaQuery.of(context);
    _orientationPortrait = _mediaData.orientation == Orientation.portrait;
    _favoriteBooksBloc = context.read<FavoriteBooksBloc>();

    _call();
  }

  Future _call() {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (context) {
          return SizedBox(
              height: _orientationPortrait
                  ? _mediaData.size.height / 2.2
                  : double.infinity,
              width: _mediaData.size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: _orientationPortrait ? 24 : 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Выбор редакции',
                          style: TextStyles.mulishBold.copyWith(
                              fontSize: 20, color: ColorStyles.primaryColor),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_outlined,
                            color: ColorStyles.primaryColor,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: _orientationPortrait ? 16 : 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          book.imageUrl,
                          width: _orientationPortrait ? 100 : 70,
                          height: _orientationPortrait ? 160 : 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: _mediaData.size.width / 2.2,
                                child: Text(
                                  book.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                  style: TextStyles.montserratSemiBold.copyWith(
                                      fontSize: 14,
                                      color: ColorStyles.primaryColor),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                book.releaseDate.year.toString(),
                                style: TextStyles.montserratMedium.copyWith(
                                    fontSize: 12,
                                    color: ColorStyles.primaryColor),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                width: _mediaData.size.width / 2.2,
                                child: Text(
                                  book.author.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.montserratBold.copyWith(
                                      fontSize: 12,
                                      color: ColorStyles.darkenedTextColor),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                width: _mediaData.size.width / 2.2,
                                child: Text(
                                  book.description,
                                  maxLines: _orientationPortrait ? 5 : 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.montserratBold.copyWith(
                                      fontSize: 12,
                                      color: ColorStyles.darkenedTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!_orientationPortrait) ..._setOrUnSetLikeButton(),
                      ],
                    ),
                    if (_orientationPortrait) ..._setOrUnSetLikeButton(),
                  ],
                ),
              ));
        });
  }

  List<Widget> _setOrUnSetLikeButton() {
    bool isFavorite = _favoriteBooksBloc.isFavorite(bookId: book.id);

    return [
      _orientationPortrait
          ? const SizedBox(
              height: 24,
            )
          : const SizedBox(
              width: 6,
            ),
      SizedBox(
        width: _orientationPortrait
            ? _mediaData.size.width
            : _mediaData.size.width / 2.8,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: ColorStyles.primaryColor),
          onPressed: () {
            _favoriteBooksBloc.switching(bookId: book.id);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/like_icon.svg',
                width: 21,
                height: 18.75,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                isFavorite ? 'Удалить из избранного' : 'Добавить в избранное',
                style: TextStyles.montserratSemiBold.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
      )
    ];
  }
}
