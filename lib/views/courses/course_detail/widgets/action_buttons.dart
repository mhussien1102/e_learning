import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../models/course.dart';

class ActionButtons extends StatelessWidget {
  final Course course;

  const ActionButtons({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (course.isPremium &&
                  !DummyDataServices.isCourseUnlocked(course.id)) {
                // code
                Get.toNamed(
                  AppRoutes.payment,
                  arguments: {
                    'courseId': course.id,
                    'courseName': course.title,
                    'price': course.price,
                  },
                );
              } else {
                //code
                Get.toNamed(
                  AppRoutes.lesson.replaceAll(':id', course.lessons.first.id),
                  parameters: {'courseId': course.id},
                );
              }
            },
            label: Text("Start Learning"),
            icon: Icon(Icons.play_circle),
          ),
        ),
        if (!course.isPremium ||
            DummyDataServices.isCourseUnlocked(course.id)) ...[
          SizedBox(width: 16),
          IconButton(
            onPressed: () {
              //code
            },
            icon: Icon(Icons.chat),
          ),
        ],
      ],
    );
  }
}
