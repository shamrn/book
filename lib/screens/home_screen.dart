import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/book/book_bloc.dart';
import 'package:good_reader/blocs/book/book_state.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/widgets/home/book_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Рекомендации',
                    style: TextStyles.mulishBold.copyWith(
                        fontSize: 20, color: ColorStyles.primaryColor),
                  ),
                  Text('Все книги',
                      style: TextStyles.mulishSemiBold.copyWith(
                          fontSize: 12, color: ColorStyles.secondColor))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              bookCardList(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder bookCardList() {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoadedState) {
          return Expanded(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.books.length,
            separatorBuilder: (context, itemIndex) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) => BookCardWidget(
              book: state.books[index],
            ),
          ));
        }
        return const CircularProgressIndicator(
          color: ColorStyles.secondColor,
        );
      },
    );
  }
}
