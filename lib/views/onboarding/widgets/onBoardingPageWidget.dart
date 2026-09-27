import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/onboarding_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingItem page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            Container(
              height: Get.height * 0.4,
              padding: EdgeInsets.all(32),
              child: Image.asset(page.image, fit: BoxFit.contain),
            ),
            SizedBox(height: 40),

            // Title
            Text(
              page.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                page.description,
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
