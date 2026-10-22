import 'package:chewie/chewie.dart';
import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../models/course.dart';

class LessonVideoController {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  final String lessonId;
  final String? courseId;

  final Function(bool) onLoadingChanged;
  final Function(Course) onCertificatedEarned;

  /// رسالة الخطأ الحقيقية (عشان تتعرض في الشاشة)
  String? errorMessage;

  bool _completed = false;
  bool _disposed = false;
  VoidCallback? _listener;

  LessonVideoController({
    required this.lessonId,
    this.courseId,
    required this.onLoadingChanged,
    required this.onCertificatedEarned,
  });

  String? get _courseId => courseId ?? Get.parameters['courseId'];

  Future<void> initializeVideo() async {
    try {
      final courseId = _courseId;
      debugPrint('CourseId: $courseId');

      if (courseId == null) {
        errorMessage = 'No Course id found in parameters';
        debugPrint(errorMessage);
        onLoadingChanged(false);
        return;
      }

      final course = DummyDataServices.getCourseById(courseId);
      debugPrint('Course Found: ${course.title}');

      if (course.isPremium && !DummyDataServices.isCourseUnlocked(courseId)) {
        onLoadingChanged(false);
        Get.back();
        Get.toNamed(
          AppRoutes.payment,
          arguments: {
            'courseId': courseId,
            'courseName': course.title,
            'price': course.price,
          },
        );
        return;
      }

      final lesson = course.lessons.firstWhere(
        (l) => l.id == lessonId,
        orElse: () => course.lessons.first,
      );

      debugPrint('Video URL: ${lesson.videoStreamUrl}');

      // networkUrl بدل network (deprecated)
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(lesson.videoStreamUrl),
      );

      await videoPlayerController!.initialize();

      // لو المستخدم خرج من الشاشة أثناء التحميل
      if (_disposed) return;

      _listener = () => onVideoProgressChanged(courseId);
      videoPlayerController!.addListener(_listener!);

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        looping: false,
        aspectRatio: 16 / 9,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              'Error: Unable to load video content\n$errorMessage',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: Colors.red),
            ),
          );
        },
      );

      onLoadingChanged(false);
    } catch (e, st) {
      errorMessage = e.toString();
      debugPrint('Error initialize: $e\n$st');
      if (!_disposed) onLoadingChanged(false);
    }
  }

  void onVideoProgressChanged(String courseId) {
    if (_completed || _disposed) return;

    final controller = videoPlayerController;
    if (controller == null) return;

    final value = controller.value;
    if (value.isInitialized &&
        value.duration > Duration.zero &&
        value.position >= value.duration) {
      _completed = true;
      if (_listener != null) controller.removeListener(_listener!);
      markLessonAsCompleted(courseId);
    }
  }

  void markLessonAsCompleted(String courseId) {
    final course = DummyDataServices.getCourseById(courseId);
    final lessonIndex = course.lessons.indexWhere((l) => l.id == lessonId);
    if (lessonIndex == -1) return;

    DummyDataServices.updateLessonStatus(courseId, lessonId, isCompleted: true);

    if (lessonIndex < course.lessons.length - 1) {
      DummyDataServices.updateLessonStatus(
        courseId,
        course.lessons[lessonIndex + 1].id,
        isCompleted: false,
      );
    }

    final isLastLesson = lessonIndex == course.lessons.length - 1;
    final allLessonCompleted = DummyDataServices.isCourseCompleted(courseId);

    Get.back(result: true);

    if (isLastLesson && allLessonCompleted) {
      onCertificatedEarned(course);
    } else {
      Get.snackbar(
        'Lesson Completed',
        'You can now proceed to the next lesson',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void dispose() {
    _disposed = true;
    if (_listener != null) {
      videoPlayerController?.removeListener(_listener!);
    }
    chewieController?.dispose();
    videoPlayerController?.dispose();
  }
}
