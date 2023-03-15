import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/root_router/router.gr.dart';

class NavigationScreen extends StatelessWidget {
  static const _routes = [
    HomeScreenRoute(),
    SearchScreenRoute(),
    FavoriteScreenRoute(),
    ProfileScreenRoute(),
  ];

  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: _routes,
        animationDuration: const Duration(milliseconds: 500),
        bottomNavigationBuilder: (_, tabsRouter) {
          return _bottomNavigationBar(tabsRouter);
        });
  }

  BottomNavigationBar _bottomNavigationBar(tabsRouter) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      iconSize: 24,
      selectedLabelStyle: TextStyles.montserratMedium.copyWith(fontSize: 10),
      unselectedLabelStyle: TextStyles.montserratMedium.copyWith(fontSize: 10),
      unselectedItemColor: ColorStyles.secondColor,
      selectedItemColor: ColorStyles.primaryColor,
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
    );
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItems {
    return [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home_icon.svg',
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/home_fill_icon.svg',
          ),
          label: 'Главная'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/search_icon.svg',
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/search_fill_icon.svg',
          ),
          label: 'Поиск'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favorite_icon.svg',
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/favorite_fill_icon.svg',
          ),
          label: 'Избранное'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profile_icon.svg',
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/profile_fill_icon.svg',
          ),
          label: 'Профиль')
    ];
  }
}
