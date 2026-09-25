import 'package:e_learning/bloc/font/font_bloc.dart';
import 'package:e_learning/bloc/font/font_state.dart';
import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/routes/routes_pages.dart';
import 'package:e_learning/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<FontBloc>(create: (context) => FontBloc())],
      child: BlocBuilder<FontBloc, FontState>(
        builder: (context, fontState) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "E-Learning App",
            theme: AppTheme.getLightTheme(fontState),
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.onGenrateRoute,
            getPages: AppPages.pages,
          );
        },
      ),
    );
  }
}
