import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/navigation/navigation_cubit.dart';
import 'package:good_reader/blocs/navigation/navigation_enum.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/screens/favorite_screen.dart';
import 'package:good_reader/screens/home_screen.dart';
import 'package:good_reader/screens/profile_screen.dart';
import 'package:good_reader/screens/search_screen.dart';

class NavigationScreen extends StatelessWidget {
  static const Map<NavigationItems, Widget> _navigationItemScreenMapper = {
    NavigationItems.home: HomeScreen(),
    NavigationItems.search: SearchScreen(),
    NavigationItems.favorite: FavoriteScreen(),
    NavigationItems.profile: ProfileScreen(),
  };

  static const List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline_sharp), label: 'Избранное'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль')
  ];

  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationItems>(
        builder: (context, item) {
          return BottomNavigationBar(
            currentIndex: item.index,
            iconSize: 24,
            selectedLabelStyle:
                TextStyles.montserratMedium.copyWith(fontSize: 10),
            unselectedLabelStyle:
                TextStyles.montserratMedium.copyWith(fontSize: 10),
            unselectedItemColor: ColorStyles.secondColor,
            selectedItemColor: ColorStyles.primaryColor,
            type: BottomNavigationBarType.fixed,
            items: _bottomNavigationBarItems,
            onTap: (index) {
              context
                  .read<NavigationCubit>()
                  .setNavigationItem(NavigationItems.values[index]);
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationItems>(
        builder: (context, item) {
          return _navigationItemScreenMapper[item]!;
        },
      ),
    );
  }
}
