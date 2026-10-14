import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStat(theme, '12', 'Course'),
            _buildStat(theme, '156', 'Hours'),
            _buildStat(theme, '86%', 'Success'),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(ThemeData theme, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
