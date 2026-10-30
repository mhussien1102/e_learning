import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/views/teacher/my_course/widgets/empty_courses_state.dart';
import 'package:e_learning/views/teacher/my_course/widgets/my_courses_app_bar.dart';
import 'package:e_learning/views/teacher/my_course/widgets/teacher_course_card.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherCourses = DummyDataServices.getInstructorCourse('inst_1');
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          MyCoursesAppBar(),
          if (teacherCourses.isEmpty)
            SliverFillRemaining(child: EmptyCoursesState())
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      TeacherCourseCard(course: teacherCourses[index]),
                  childCount: teacherCourses.length, // <-- the fix
                ),
              ),
            ),
        ],
      ),
    );
  }
}
