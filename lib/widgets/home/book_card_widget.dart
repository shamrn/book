import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_bloc.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_state.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/models/book.dart';
import 'package:good_reader/widgets/home/like_button_widget.dart';
import 'package:good_reader/widgets/home/model_bottom_sheet_widget.dart';

class BookCardWidget extends StatelessWidget {
  final Book book;

  const BookCardWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BookDetailModalBottomSheetWidget(context: context, book: book);
      },
      child: Container(
        height: 116,
        decoration: BoxDecoration(
            color: ColorStyles.darkenedBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Text(book.name,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.montserratSemiBold.copyWith(
                            fontSize: 14, color: ColorStyles.primaryColor)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(book.releaseDate.year.toString(),
                      style: TextStyles.montserratMedium.copyWith(
                          fontSize: 12, color: ColorStyles.secondColor)),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Text(
                      book.author.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyles.montserratBold.copyWith(
                          fontSize: 12, color: ColorStyles.darkenedTextColor),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: BlocBuilder<FavoriteBooksBloc, FavoriteBooksState>(
                  builder: (context, state) {
                    if (state is FavoriteBooksLoadedState) {
                      return FavoriteButtonWidget(
                        bookId: book.id,
                        isFavorite: state.bookIds.contains(book.id),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
