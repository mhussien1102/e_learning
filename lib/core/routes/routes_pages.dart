import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
  ];
}
