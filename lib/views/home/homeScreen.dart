import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/models/category.dart';
import 'package:e_learning/views/home/widget/category_section.dart';
import 'package:e_learning/views/home/widget/home_appbar.dart';
import 'package:e_learning/views/home/widget/in_progress_section.dart';
import 'package:e_learning/views/home/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
      id: '1',
      name: "Programming",
      icon: Icons.code,
      courseCount: DummyDataServices.getCourseByCategory('1').length,
    ),

    Category(
      id: '2',
      name: "Design",
      icon: Icons.brush,
      courseCount: DummyDataServices.getCourseByCategory('2').length,
    ),

    Category(
      id: '3',
      name: "Bussiness",
      icon: Icons.business,
      courseCount: DummyDataServices.getCourseByCategory('3').length,
    ),

    Category(
      id: '4',
      name: "Music",
      icon: Icons.music_note,
      courseCount: DummyDataServices.getCourseByCategory('4').length,
    ),

    Category(
      id: '5',
      name: "Photography",
      icon: Icons.camera_alt,
      courseCount: DummyDataServices.getCourseByCategory('5').length,
    ),

    Category(
      id: '6',
      name: "Langauge",
      icon: Icons.language,
      courseCount: DummyDataServices.getCourseByCategory('6').length,
    ),

    Category(
      id: '7',
      name: "Health & Fitness",
      icon: Icons.fitness_center,
      courseCount: DummyDataServices.getCourseByCategory('7').length,
    ),

    Category(
      id: '8',
      name: "Personal Development",
      icon: Icons.psychology,
      courseCount: DummyDataServices.getCourseByCategory('8').length,
    ),
  ];

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SearchBarWidget(),
              SizedBox(height: 32),
              CategorySection(categories: categories),
              SizedBox(height: 32),
              InProgressSection(),
            ]),
          ),
        ),
      ],
    );
  }
}
