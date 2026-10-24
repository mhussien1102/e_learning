import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class QuizAttemptAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String formattedTime;
  final VoidCallback onSubmit;

  const QuizAttemptAppBar({
    super.key,
    required this.formattedTime,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.accent),
      backgroundColor: AppColors.primary,
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.timer_outlined, color: AppColors.accent, size: 20),
            SizedBox(width: 8),
            Text(
              formattedTime,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8),
          child: TextButton(
            onPressed: onSubmit,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.accent.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Submit',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
