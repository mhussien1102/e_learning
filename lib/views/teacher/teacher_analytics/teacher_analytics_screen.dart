import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/views/teacher/teacher_analytics/widgets/enrollment_chart_widget.dart';
import 'package:e_learning/views/teacher/teacher_analytics/widgets/over_view_card_widget.dart';
import 'package:e_learning/views/teacher/teacher_analytics/widgets/revenue_stats_widget.dart';
import 'package:e_learning/views/teacher/teacher_analytics/widgets/student_engagement_widget.dart';
import 'package:e_learning/views/teacher/teacher_analytics/widgets/teacher_analytics_app_bar.dart';
import 'package:flutter/material.dart';

class TeacherAnalyticsScreen extends StatelessWidget {
  const TeacherAnalyticsScreen({super.key});

  final String instructorId = 'inst_1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          TeacherAnalyticsAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverViewCardWidget(instructorId: instructorId),
                  SizedBox(height: 24),
                  EnrollmentChartWidget(instructorId: instructorId),
                  SizedBox(height: 24),
                  RevenueStatsWidget(),
                  SizedBox(height: 24),
                  StudentEngagementWidget(instructorId: instructorId),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
