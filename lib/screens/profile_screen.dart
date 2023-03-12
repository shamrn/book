import 'package:flutter/material.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/widgets/profile/form_list_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 48.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Профиль',
                  style: TextStyles.mulishBold.copyWith(
                      fontSize: 20.0, color: ColorStyles.primaryColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_image.jpeg'),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'Введите своё имя и при желании добавьте фото профиля',
                        softWrap: true,
                        style: TextStyles.montserratMedium.copyWith(
                            fontSize: 12, color: ColorStyles.secondColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                FormListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
