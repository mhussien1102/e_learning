import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/quiz.dart';
import 'package:e_learning/models/quiz_attemps.dart';
import 'package:flutter/material.dart';

class QuizStatusCard extends StatelessWidget {
  final QuizAttempt attempt;
  final Quiz quiz;

  const QuizStatusCard({super.key, required this.attempt, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final correctAnswer = quiz.questions
        .where((q) => attempt.answers[q.id] == q.correctOptionId)
        .length;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quiz Statistics",
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildStatRow(
            theme,
            'Time Spent',
            '${attempt.timeSpent ~/ 60}m ${attempt.timeSpent % 60}s',
            Icons.timer,
          ),

          _buildStatRow(
            theme,
            'Correct Answers',
            '$correctAnswer/${quiz.questions.length}',
            Icons.check_circle,
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          SizedBox(width: 12),
          Text(
            label,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.secondary,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
