import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 180,
      pinned: true,
      floating: false,
      backgroundColor: AppColors.primary,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.analytics, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.accent.withValues(alpha: 0.7),
              ),
            ),
            Text(
              "Mohammed Hussien",
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.accent.withValues(alpha: 0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
    );
  }
}
