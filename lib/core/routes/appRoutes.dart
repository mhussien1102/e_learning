import 'package:e_learning/views/auth/loginScreen.dart';
import 'package:e_learning/views/home/homeScreen.dart';
import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../views/onboarding/onBoardingScreen.dart';

class AppRoutes {
  //auth routes
  static const String splash = '/splsh';
  static const String onBoarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => Loginscreen());
      case home:
        return MaterialPageRoute(builder: (_) => Homescreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Page Found!"))),
        );
    }
  }
}
