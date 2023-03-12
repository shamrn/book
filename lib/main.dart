import 'package:flutter/material.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/core/services/splash_screen.dart';
import 'package:good_reader/root_router/router.gr.dart';

void main() {
  runSplashScreen();

  return runApp(GoodReaderApp());
}

class GoodReaderApp extends StatelessWidget {
  final _rootRouter = RootRouter();

  GoodReaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerDelegate: _rootRouter.delegate(),
      routeInformationParser: _rootRouter.defaultRouteParser(),

      theme: ThemeData(canvasColor: ColorStyles.canvasColor),
    );
  }
}
