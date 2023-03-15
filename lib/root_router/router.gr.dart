// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../screens/favorite_screen.dart' as _i4;
import '../screens/home_screen.dart' as _i2;
import '../screens/navigation_screen.dart' as _i1;
import '../screens/profile_screen.dart' as _i5;
import '../screens/search_screen.dart' as _i3;

class RootRouter extends _i6.RootStackRouter {
  RootRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    NavigationScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NavigationScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    SearchScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SearchScreen(),
      );
    },
    FavoriteScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FavoriteScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          NavigationScreenRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              HomeScreenRoute.name,
              path: 'home_screen/',
              parent: NavigationScreenRoute.name,
            ),
            _i6.RouteConfig(
              SearchScreenRoute.name,
              path: 'search_screen/',
              parent: NavigationScreenRoute.name,
            ),
            _i6.RouteConfig(
              FavoriteScreenRoute.name,
              path: 'favorite_screen/',
              parent: NavigationScreenRoute.name,
            ),
            _i6.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile_screen/',
              parent: NavigationScreenRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.NavigationScreen]
class NavigationScreenRoute extends _i6.PageRouteInfo<void> {
  const NavigationScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NavigationScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'NavigationScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home_screen/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.SearchScreen]
class SearchScreenRoute extends _i6.PageRouteInfo<void> {
  const SearchScreenRoute()
      : super(
          SearchScreenRoute.name,
          path: 'search_screen/',
        );

  static const String name = 'SearchScreenRoute';
}

/// generated route for
/// [_i4.FavoriteScreen]
class FavoriteScreenRoute extends _i6.PageRouteInfo<void> {
  const FavoriteScreenRoute()
      : super(
          FavoriteScreenRoute.name,
          path: 'favorite_screen/',
        );

  static const String name = 'FavoriteScreenRoute';
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileScreenRoute extends _i6.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile_screen/',
        );

  static const String name = 'ProfileScreenRoute';
}
