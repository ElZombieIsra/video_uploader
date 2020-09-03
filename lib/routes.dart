import 'package:flutter/material.dart';
import 'package:video_uploader/presentation/screens/home_screen.dart';
import 'package:video_uploader/presentation/screens/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  RoutesNames.splash: (_) => SplashScreen(),
  RoutesNames.home: (_) => HomeScreen(),
};

class RoutesNames {
  static const String splash = "/";
  static const String home = "/home";
}
