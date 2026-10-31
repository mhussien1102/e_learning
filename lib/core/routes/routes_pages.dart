import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/main_screen.dart';
import 'package:e_learning/models/quiz_attemps.dart';
import 'package:e_learning/views/auth/forget_password_screen.dart';
import 'package:e_learning/views/auth/loginScreen.dart';
import 'package:e_learning/views/auth/register_screen.dart';
import 'package:e_learning/views/chat/chat_list_screen.dart';
import 'package:e_learning/views/courses/course_detail/course_detail_screen.dart';
import 'package:e_learning/views/courses/course_list/course_list_screen.dart';
import 'package:e_learning/views/courses/lesson_screen/lesson_screen.dart';
import 'package:e_learning/views/courses/payment/payment_screen.dart';
import 'package:e_learning/views/home/homeScreen.dart';
import 'package:e_learning/views/notifications/notifications_screen.dart';
import 'package:e_learning/views/onboarding/onBoardingScreen.dart';
import 'package:e_learning/views/profile/profile_screen.dart';
import 'package:e_learning/views/quiz/quiz_attempt/quiz_attempt_screen.dart';
import 'package:e_learning/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:e_learning/views/quiz/quiz_result/quiz_result_screen.dart';
import 'package:e_learning/views/splash/splash_screen.dart';
import 'package:e_learning/views/teacher/my_course/my_courses_screen.dart';
import 'package:get/get.dart';

import '../../models/quiz.dart';
import '../../views/teacher/teacher_home_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => Loginscreen()),
    GetPage(name: AppRoutes.home, page: () => Homescreen()),
    GetPage(name: AppRoutes.register, page: () => RegisterScreen()),
    GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: AppRoutes.notifications, page: () => NotificationsScreen()),
    GetPage(name: AppRoutes.teacherHome, page: () => TeacherHomeScreen()),
    GetPage(name: AppRoutes.myCourses, page: () => MyCoursesScreen()),
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

    GetPage(name: AppRoutes.quizList, page: () => QuizListScreen()),
    GetPage(
      name: '/quiz/:id',
      page: () => QuizAttemptScreen(quizId: Get.parameters['id'] ?? ''),
    ),
    GetPage(
      name: '/quiz/:id',
      page: () => QuizResultScreen(
        attempt: Get.arguments['attemp'] as QuizAttempt,
        quiz: Get.arguments['quiz'] as Quiz,
      ),
    ),
    GetPage(
      name: AppRoutes.lesson,
      page: () => LessonScreen(lessonId: Get.parameters['id'] ?? ''),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentScreen(
        courseId: Get.arguments['courseId'] as String,
        courseName: Get.arguments['courseName'] as String,
        price: Get.arguments['price'] as double,
      ),
    ),
    GetPage(
      name: '/course/:id',
      page: () => CourseDetailScreen(courseId: Get.parameters['id'] ?? ''),
    ),

    GetPage(name: AppRoutes.profile, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.teacherChats, page: () => ChatListScreen()),
  ];
}
