import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProfileAppBar extends StatelessWidget {
  final String initials;
  final String fullName;
  final String email;

  const ProfileAppBar({
    super.key,
    required this.initials,
    required this.fullName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primaryLight],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.lightSurface,
                  child: Text(
                    initials,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                fullName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                email,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.accent.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
