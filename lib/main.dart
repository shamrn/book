import 'package:flutter/material.dart';
import 'package:good_reader/core/services/splash_screen.dart';

void main() {
  runSplashScreen();

  return runApp(const GoodReaderApp());
}

class GoodReaderApp extends StatelessWidget {
  const GoodReaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
