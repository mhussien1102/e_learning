import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/models/course.dart';
import 'package:e_learning/views/courses/course_detail/widgets/action_buttons.dart';
import 'package:e_learning/views/courses/course_detail/widgets/course_details_appBar.dart';
import 'package:e_learning/views/courses/course_detail/widgets/course_info_card.dart';
import 'package:e_learning/views/courses/course_detail/widgets/lesson_list.dart';
import 'package:e_learning/views/courses/course_detail/widgets/rating_widget.dart';
import 'package:e_learning/views/courses/course_detail/widgets/review_sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseId;

  const CourseDetailScreen({super.key, required this.courseId});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lastLesson = Get.parameters['lastLesson'];
    final id = Get.parameters['id'] ?? widget.courseId;
    final course = DummyDataServices.getCourseById(id);
    final isCompleted = DummyDataServices.isCourseCompleted(course.id);
    final isUnlocked = DummyDataServices.isCourseUnlocked(widget.courseId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CourseDetailsAppBar(imageUrl: course.imageUrl),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  RatingWidget(course: course, theme: theme),
                  SizedBox(height: 16),
                  Text(course.description, style: theme.textTheme.bodyLarge),
                  SizedBox(height: 16),
                  CourseInfoCard(course: course),
                  SizedBox(height: 24),
                  Text(
                    'Course content',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  LessonList(
                    courseId: widget.courseId,
                    isUnlocked: isUnlocked,
                    onLessonComplete: () => setState(() {}),
                  ),
                  SizedBox(height: 24),
                  ReviewSections(courseId: widget.courseId),
                  SizedBox(height: 16),
                  ActionButtons(course: course),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: course.isPremium && !isUnlocked
          ? Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    offset: Offset(0, -5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // code
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.all(16),
                ),
                child: Text('Buy Now For \$${course.price}'),
              ),
            )
          : null,
    );
  }
}
