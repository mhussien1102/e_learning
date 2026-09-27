import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/views/auth/loginScreen.dart';
import 'package:e_learning/views/home/homeScreen.dart';
import 'package:e_learning/views/onboarding/onBoardingScreen.dart';
import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => Loginscreen()),
    GetPage(name: AppRoutes.home, page: () => Homescreen()),
  ];
}
