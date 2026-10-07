import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TimeWidget extends StatelessWidget {
  const new({super.key, required this.duration});

  final String duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: 14, color: AppColors.secondary),
        SizedBox(width: 4),
        Text(
          duration,
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }
}
