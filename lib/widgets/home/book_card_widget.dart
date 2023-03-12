import 'package:flutter/material.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/models/book.dart';
import 'package:good_reader/widgets/home/like_button_widget.dart';

class BookCardWidget extends StatelessWidget {
  final BookList book;
  const BookCardWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 116,
        decoration: BoxDecoration(
            color: ColorStyles.darkenedColor,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
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
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      book.author.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.montserratBold.copyWith(
                          fontSize: 12, color: const Color(0xFF595858)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.topRight,
                child: LikeButtonWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
