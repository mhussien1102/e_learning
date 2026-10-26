import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icons;
  final bool isUnread;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.icons,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isUnread
            ? AppColors.primary.withValues(alpha: 0.1)
            : AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              child: Icon(icons, color: AppColors.primary),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(message, style: theme.textTheme.bodyMedium),
                  SizedBox(height: 6),
                  Text(
                    time,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
