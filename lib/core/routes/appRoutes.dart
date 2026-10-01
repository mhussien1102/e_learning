import 'package:e_learning/views/auth/loginScreen.dart';
import 'package:e_learning/views/home/homeScreen.dart';
import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../views/auth/forget_password_screen.dart';
import '../../views/auth/register_screen.dart';
import '../../views/onboarding/onBoardingScreen.dart';
import '../../views/teacher/teacher_home_screen.dart';

class AppRoutes {
  //auth routes
  static const String splash = '/splsh';
  static const String onBoarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String teacherHome = '/teacherHome';

  static Route<dynamic> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => Loginscreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case teacherHome:
        return MaterialPageRoute(builder: (_) => TeacherHomeScreen());
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
