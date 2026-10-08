import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/views/courses/course_list/widgets/course_card.dart';
import 'package:e_learning/views/courses/course_list/widgets/course_filter_dialog.dart';
import 'package:e_learning/views/courses/course_list/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../../core/theme/app_colors.dart';

class CourseListScreen extends StatelessWidget {
  final String? categoryId;
  final String? categoryName;
  final bool showBackButton;

  const CourseListScreen({
    super.key,
    this.categoryId,
    this.categoryName,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courses = categoryId != null
        ? DummyDataServices.getCourseByCategory(categoryId!)
        : DummyDataServices.courses;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primary,
            automaticallyImplyLeading: categoryId != null || showBackButton,
            leading: (categoryId != null || showBackButton)
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  )
                : null,
            actions: [
              IconButton(
                onPressed: () => _showFilterDialog(context),
                icon: Icon(Icons.filter_list, color: AppColors.accent),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(6),
              title: Text(
                categoryName ?? 'All Course',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          if (courses.isEmpty)
            SliverFillRemaining(
              child: EmptyStateWidget(onActionPressed: () => Get.back()),
            )
          else
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final course = courses[index];
                  return CourseCard(
                    courseId: course.id,
                    title: course.title,
                    subtitle: course.description,
                    imageUrl: course.imageUrl,
                    rating: course.rating,
                    duration: '${course.lessons.length * 30} mins',
                    isPremium: course.isPremium,
                  );
                }, childCount: courses.length),
              ),
            ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CourseFilterDialog(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}
