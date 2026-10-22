import 'package:flutter/material.dart';

import '../../../../models/lessons.dart';

class RowDuration extends StatelessWidget {
  const new({super.key, required this.theme, required this.lesson});

  final ThemeData theme;
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: 16, color: theme.colorScheme.secondary),
        SizedBox(width: 8),
        Text(
          "${lesson.duration} minutes",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
