import 'package:auto_route/annotations.dart';
import 'package:good_reader/screens/navigation_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: NavigationScreen, initial: true),
])
class $RootRouter {}
