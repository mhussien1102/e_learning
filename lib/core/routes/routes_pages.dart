import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/main_screen.dart';
import 'package:e_learning/views/auth/forget_password_screen.dart';
import 'package:e_learning/views/auth/loginScreen.dart';
import 'package:e_learning/views/auth/register_screen.dart';
import 'package:e_learning/views/courses/course_list/course_list_screen.dart';
import 'package:e_learning/views/home/homeScreen.dart';
import 'package:e_learning/views/onboarding/onBoardingScreen.dart';
import 'package:e_learning/views/profile/profile_screen.dart';
import 'package:e_learning/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../../views/teacher/teacher_home_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => Loginscreen()),
    GetPage(name: AppRoutes.home, page: () => Homescreen()),
    GetPage(name: AppRoutes.register, page: () => RegisterScreen()),
    GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: AppRoutes.teacherHome, page: () => TeacherHomeScreen()),
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(
        initalIndex: Get.arguments is Map<String, dynamic>
            ? Get.arguments['initialIndex'] as int?
            : null,
      ),
    ),
    GetPage(
      name: AppRoutes.courseList,
      page: () => CourseListScreen(
        categoryId: Get.arguments?['category'] as String?,
        categoryName: Get.arguments?['categoryName'] as String?,
      ),
    ),

    GetPage(name: AppRoutes.quiz, page: () => QuizListScreen()),

    GetPage(name: AppRoutes.profile, page: () => ProfileScreen()),
  ];
}
