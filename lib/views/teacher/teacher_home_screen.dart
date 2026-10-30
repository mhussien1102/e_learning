import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/utils/app_dialogs.dart';
import 'package:e_learning/views/teacher/teacher_home/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/theme/app_colors.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primary,
            actions: [
              IconButton(
                onPressed: () async {
                  final confirm = await AppDialogs.showLogoutDialog();
                  if (confirm == true) {
                    Get.offAllNamed(AppRoutes.login);
                  }
                },
                icon: Icon(Icons.logout, color: AppColors.accent),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Teacher Dashboard",
                style: TextStyle(color: AppColors.accent),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                DashboardCard(
                  title: 'My Courses',
                  icons: Icons.book,
                  onTap: () => Get.toNamed(AppRoutes.myCourses),
                ),
                DashboardCard(
                  title: 'Create Course',
                  icons: Icons.add_circle,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Analytics',
                  icons: Icons.analytics,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Student Progress',
                  icons: Icons.people,
                  onTap: () {},
                ),
                DashboardCard(
                  title: 'Message',
                  icons: Icons.chat,
                  onTap: () {},
                ),
              ]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
