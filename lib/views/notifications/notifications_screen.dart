import 'package:e_learning/views/notifications/widgets/notification_list.dart';
import 'package:e_learning/views/notifications/widgets/notifications_settings_scetion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationsSettingsSection(),
                  SizedBox(height: 24),
                  Text(
                    "Recent Notification",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  NotificationsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
