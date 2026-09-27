import 'package:e_learning/bloc/auth/auth_bloc.dart';
import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/services/storge_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _hasNaivagete = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );
    _animationController.forward();

    // delay naivagtion
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted || _hasNaivagete) return;
      _handleNaivagetion(context);
    });
  }

  void _handleNaivagetion(BuildContext context) {
    if (_hasNaivagete) return;
    _hasNaivagete = true;

    final authState = context.read<AuthBloc>().state;
    if (StorgeServices.isFirstTime()) {
      StorgeServices.setFirstTime(false);
      Get.offNamed(AppRoutes.onBoarding);
    } else if (authState.userModel != null) {
      //navigte to home screen
      Get.offNamed(AppRoutes.home);
    } else {
      //navigte to Login screen
      Get.offNamed(AppRoutes.login);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.school,
                        size: 80,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                //App transatoin name
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        Text(
                          "Education Pro",
                          style: theme.textTheme.displayMedium?.copyWith(
                            color: theme.colorScheme.surface,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Learn AnyWhere, Achieve EveryWhere",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.surface,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 60),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.surface,
                            strokeWidth: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
