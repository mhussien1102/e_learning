import 'package:e_learning/views/profile/widget/profile_app_bar.dart';
import 'package:e_learning/views/profile/widget/profile_options.dart';
import 'package:e_learning/views/profile/widget/profile_stats_card.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          ProfileAppBar(
            email: 'b@gmail.com',
            fullName: 'Mohamed Hussien',
            initials: 'MH',
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ProfileStatsCard(),
                  SizedBox(height: 24),
                  ProfileOptions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
