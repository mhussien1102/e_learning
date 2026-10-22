import 'package:chewie/chewie.dart';
import 'package:e_learning/controller/video_controller.dart';
import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/lessons.dart';
import 'package:e_learning/views/courses/lesson_screen/widget/certificate_dialog.dart';
import 'package:e_learning/views/courses/lesson_screen/widget/resource_tile.dart';
import 'package:e_learning/views/courses/lesson_screen/widget/row_duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/course.dart';

class LessonScreen extends StatefulWidget {
  final String lessonId;

  const LessonScreen({super.key, required this.lessonId});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final LessonVideoController _videoController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _videoController = LessonVideoController(
      lessonId: widget.lessonId,
      courseId: Get.parameters['courseId'],
      onLoadingChanged: (bool loading) {
        if (mounted) setState(() => _isLoading = loading);
      },
      onCertificatedEarned: (course) {
        if (mounted) {
          _showCertificateDialog(context, course);
        }
      },
    );
    _videoController.initializeVideo();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _showCertificateDialog(BuildContext context, Course course) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CertificateDialog(
          course: course,
          onDownload: () => _downloadCertifacte(course),
        );
      },
    );
  }

  void _downloadCertifacte(Course course) {
    Get.snackbar(
      "Certificate Ready",
      "Your Certificate For ${course.title} has been generated",
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseId = Get.parameters['courseId'];
    final course = courseId != null
        ? DummyDataServices.getCourseById(courseId)
        : null;
    final isUnlocked = courseId != null
        ? DummyDataServices.isCourseUnlocked(courseId)
        : false;

    if (course == null) {
      return const Scaffold(body: Center(child: Text('Course not Found')));
    }

    if (course.isPremium && !isUnlocked) {
      return const Scaffold(
        body: Center(child: Text('Please Purchase the Course')),
      );
    }

    final lesson = course.lessons.firstWhere(
      (l) => l.id == widget.lessonId,
      orElse: () => course.lessons.first,
    );

    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: _isLoading
                ? Container(
                    color: theme.colorScheme.surface,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : _videoController.chewieController != null
                ? Chewie(controller: _videoController.chewieController!)
                : Container(
                    color: theme.colorScheme.surface,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Error Loading video\n${_videoController.errorMessage ?? ''}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  RowDuration(theme: theme, lesson: lesson),
                  SizedBox(height: 24),
                  Text(
                    "Description",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    lesson.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Resource",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ...lesson.resources.map(
                    (resource) => ResourceTile(
                      title: resource.title,
                      icon: _getIconForResourceType(resource.type),
                      onTap: () {
                        //code
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getIconForResourceType(String type) {
    switch (type.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'zip':
        return Icons.folder_zip;

      default:
        return Icons.insert_drive_file;
    }
  }
}
