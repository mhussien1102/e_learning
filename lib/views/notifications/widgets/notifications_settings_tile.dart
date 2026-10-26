import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class NotificationsSettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget trailing;

  const NotificationsSettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
