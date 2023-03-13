import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_reader/blocs/book/book_bloc.dart';
import 'package:good_reader/blocs/book/book_event.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_bloc.dart';
import 'package:good_reader/blocs/favorite_books/favorite_books_event.dart';
import 'package:good_reader/blocs/navigation/navigation_cubit.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:good_reader/core/services/splash_screen.dart';
import 'package:good_reader/root_router/router.gr.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox(favoriteBooksBoxName);

  runSplashScreen();

  return runApp(GoodReaderApp());
}

class GoodReaderApp extends StatelessWidget {
  final _rootRouter = RootRouter();

  GoodReaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<BookBloc>(
            create: (context) => BookBloc()..add(BookLoadEvent())),
        BlocProvider<FavoriteBooksBloc>(
          create: (context) =>
              FavoriteBooksBloc()..add(FavoriteBooksLoadEvent()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _rootRouter.delegate(),
        routeInformationParser: _rootRouter.defaultRouteParser(),
        theme: ThemeData(canvasColor: ColorStyles.canvasColor),
      ),
    );
  }
}
