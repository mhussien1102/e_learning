import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'divider_notification.dart';
import 'notifications_settings_tile.dart';

class NotificationsSettingsSection extends StatelessWidget {
  const NotificationsSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          NotificationsSettingsTile(
            title: 'Push Notifications',
            subtitle: 'Receive Notification',
            icon: Icons.notifications_outlined,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
          DividerNotification(),
          NotificationsSettingsTile(
            title: 'Course Update',
            subtitle: 'Get notified about course update',
            icon: Icons.school_outlined,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
          DividerNotification(),
          NotificationsSettingsTile(
            title: 'Quiz Reminder',
            subtitle: 'Receiver quiz deadline remainder ',
            icon: Icons.quiz_outlined,
            trailing: Switch(
              value: false,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
