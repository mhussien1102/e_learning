import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/views/profile/widget/profile_options_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/app_dialogs.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionsCard(
          title: 'Edit Your Profile',
          subTitle: 'Update Your personal information',
          icon: Icons.edit_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Notifications',
          subTitle: 'Manage Your Notifications',
          icon: Icons.notifications_outlined,
          onTap: () => Get.toNamed(AppRoutes.notifications),
        ),
        ProfileOptionsCard(
          title: 'Setting',
          subTitle: 'App Preference and more',
          icon: Icons.settings_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Help & Support',
          subTitle: 'Get help or contact support',
          icon: Icons.help_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Logout',
          subTitle: 'Sign out of your account',
          icon: Icons.logout_outlined,
          onTap: () async {
            final confirm = await AppDialogs.showLogoutDialog();
            if (confirm == true) {
              Get.offAllNamed(AppRoutes.login);
            }
          },
          isDestructive: true,
        ),
      ],
    );
  }
}
