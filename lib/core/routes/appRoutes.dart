import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  //auth routes
  static const String splash = '/splsh';

  static Route<dynamic> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Page Found!"))),
        );
    }
  }
}
