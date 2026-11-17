import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class OverViewCardWidget extends StatelessWidget {
  final String instructorId;

  const OverViewCardWidget({super.key, required this.instructorId});

  @override
  Widget build(BuildContext context) {
    final stats = DummyDataServices.getTeacherStats(instructorId);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildStateCard(
          'Total Student',
          '${stats.totalStudents}',
          Icons.people,
        ),
        _buildStateCard(
          'Active Course',
          '${stats.activeCourses}',
          Icons.school,
        ),
        _buildStateCard(
          'Total Revenue',
          stats.totalRevenue.toStringAsFixed(2),
          Icons.attach_money,
        ),
        _buildStateCard(
          'Avg Rating',
          stats.averageRating.toString(),
          Icons.star,
        ),
      ],
    );
  }

  Widget _buildStateCard(String title, String value, IconData icon) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final maxWidth = constrains.maxWidth;
        final maxHeight = constrains.maxHeight;

        final iconSize = maxHeight * 0.25;
        final valueFontSize = maxWidth * 0.15;
        final titleFontSize = maxWidth * 0.08;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primary, size: iconSize),
              SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
