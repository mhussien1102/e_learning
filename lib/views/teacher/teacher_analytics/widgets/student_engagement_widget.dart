import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StudentEngagementWidget extends StatelessWidget {
  final String instructorId;

  const StudentEngagementWidget({super.key, required this.instructorId});

  @override
  Widget build(BuildContext context) {
    final stats = DummyDataServices.getTeacherStats(instructorId);
    final engagement = stats.studentEngagement;
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Student Engagmant",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          _buildEngagmentMetric(
            title: 'Average Completation',
            value: '${(engagement.averageCompletionRate * 100).toInt()}%',
            icon: Icons.school,
          ),
          Divider(height: 32, color: Colors.grey..shade300),
          _buildEngagmentMetric(
            title: 'Average Time Per Lesson',
            value: '${engagement.averageTimePerLesson} mins',
            icon: Icons.timer,
          ),
          Divider(height: 32, color: Colors.grey.shade300),
          _buildEngagmentMetric(
            title: 'Active Student this Week',
            value: engagement.activeStudentsThisWeek.toString(),
            icon: Icons.people,
          ),
        ],
      ),
    );
  }

  Widget _buildEngagmentMetric({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
