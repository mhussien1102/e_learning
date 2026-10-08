import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CourseFilterDialog extends StatelessWidget {
  const CourseFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filter Course",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildFilterOption(context, 'All levels', true),
          _buildFilterOption(context, 'Beginner', false),
          _buildFilterOption(context, 'Intermediate', false),
          _buildFilterOption(context, 'Advanced', false),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Reset'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Reset'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(
    BuildContext context,
    String label,
    bool isSelected,
  ) {
    return ListTile(
      trailing: isSelected
          ? Icon(Icons.check_circle, color: AppColors.primary)
          : Icon(Icons.circle_outlined),
      title: Text(label),
      onTap: () {
        // impl the Logic Filter
        Navigator.pop(context);
      },
    );
  }
}
