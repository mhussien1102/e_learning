import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:flutter/material.dart';

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
              } else {
                //code
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
