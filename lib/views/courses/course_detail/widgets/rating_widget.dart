import 'package:flutter/material.dart';

import '../../../../models/course.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.course, required this.theme});

  final Course course;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 4),
        Text(course.rating.toString(), style: theme.textTheme.bodyMedium),
        SizedBox(width: 4),
        Text(
          '(${course.reviewCount} reviews)',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        Spacer(),
        Text(
          '(\$${course.price})',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
