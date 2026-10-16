import 'package:e_learning/models/course.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CourseInfoCard extends StatelessWidget {
  final Course course;

  const CourseInfoCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: AppColors.primary.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(
                  context,
                  Icons.people,
                  '${course.enrollmentCount}+',
                  'Students',
                ),

                _buildInfoItem(
                  context,
                  Icons.star,
                  course.rating.toString(),
                  '${course.reviewCount} Reviews',
                ),

                _buildInfoItem(
                  context,
                  Icons.library_books,
                  '${course.lessons.length}',
                  'Lessons',
                ),

                _buildInfoItem(
                  context,
                  Icons.signal_cellular_alt,
                  course.level,
                  'Level',
                ),
              ],
            ),
            SizedBox(height: 16),
            if (course.requirements.isNotEmpty) ...[
              _buildSectionTitle(context, 'Requirements'),
              SizedBox(height: 8),
              ...course.requirements.map(
                (requirement) => _buildRequirementItem(context, requirement),
              ),
              SizedBox(height: 16),
            ],
            if (course.whatYouWillLearn.isNotEmpty) ...[
              _buildSectionTitle(context, 'What you\'ll learn'),
              SizedBox(height: 8),
              ...course.whatYouWillLearn.map(
                (item) => _buildLearingItem(context, item),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRequirementItem(BuildContext context, String requirement) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('.', style: TextStyle(color: AppColors.primary)),
          Expanded(child: Text(requirement, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildLearingItem(BuildContext context, String item) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: AppColors.primary, size: 16),
          SizedBox(width: 8),
          Expanded(child: Text(item, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
