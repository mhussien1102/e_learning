import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String description;
  final int questionCount;
  final int timeLimit;
  final VoidCallback onTap;

  const QuizCard({
    super.key,
    required this.title,
    required this.description,
    required this.questionCount,
    required this.timeLimit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuizStats(
                      theme: theme,
                      icon: Icons.quiz_outlined,
                      text: '$questionCount Questions',
                    ),
                    _buildQuizStats(
                      theme: theme,
                      icon: Icons.timer_outlined,
                      text: '$timeLimit Questions',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizStats({
    required ThemeData theme,
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.secondary),
        SizedBox(width: 8),
        Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
