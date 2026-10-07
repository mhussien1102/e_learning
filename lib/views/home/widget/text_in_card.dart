import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TextInCard extends StatelessWidget {
  const TextInCard({
    super.key,
    required this.title,
    required this.instructorId,
  });

  final String title;
  final String instructorId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.person_outline, color: AppColors.secondary, size: 14),
              SizedBox(width: 4),
              Text(
                'Instructor $instructorId',
                style: Theme.of(context).textTheme.bodySmall
                    ?.copyWith(color: AppColors.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
