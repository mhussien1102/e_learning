import 'package:flutter/material.dart';

import 'notification_card.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return NotificationCard(
          title: 'New Course Available',
          message: 'Check out our new Flutter Advanced course!',
          time: '2 hours ago',
          icons: Icons.school,
          isUnread: index == 0,
        );
      },
    );
  }
}
