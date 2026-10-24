import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/questions.dart';
import 'package:e_learning/models/quiz.dart';
import 'package:e_learning/models/quiz_attemps.dart';
import 'package:flutter/material.dart';

class QuizQuestionAnalysis extends StatelessWidget {
  final Quiz quiz;
  final QuizAttempt attempt;

  const QuizQuestionAnalysis({
    super.key,
    required this.quiz,
    required this.attempt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            "Question Analysis",
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ...quiz.questions.map((question) {
            final userAnswer = attempt.answers[question.id];
            final isCorrect = userAnswer == question.correctOptionId;
            return _buildQuestionResult(theme, question, isCorrect);
          }),
        ],
      ),
    );
  }

  Widget _buildQuestionResult(
    ThemeData theme,
    Question question,
    bool isCorrect,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          Expanded(
            child: Text(
              question.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
