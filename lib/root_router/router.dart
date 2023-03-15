import 'package:auto_route/annotations.dart';
import 'package:good_reader/screens/favorite_screen.dart';
import 'package:good_reader/screens/home_screen.dart';
import 'package:good_reader/screens/navigation_screen.dart';
import 'package:good_reader/screens/profile_screen.dart';
import 'package:good_reader/screens/search_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
      page: NavigationScreen,
      initial: true,
      path: '/',
      children: [
        AutoRoute(page: HomeScreen, path: 'home_screen/'),
        AutoRoute(page: SearchScreen, path: 'search_screen/'),
        AutoRoute(page: FavoriteScreen, path: 'favorite_screen/'),
        AutoRoute(page: ProfileScreen, path: 'profile_screen/'),
      ]
  ),

])
class $RootRouter {}
