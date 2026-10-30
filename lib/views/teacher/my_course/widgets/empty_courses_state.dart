import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyCoursesState extends StatelessWidget {
  const EmptyCoursesState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school_outlined, color: AppColors.primary, size: 64),
          SizedBox(height: 16),
          Text(
            "No Courses Yet",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.7),
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // code
            },
            child: Text("Create Your First Course"),
          ),
        ],
      ),
    );
  }
}
