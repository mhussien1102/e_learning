import 'package:e_learning/models/category.dart';
import 'package:e_learning/views/home/widget/category_section.dart';
import 'package:e_learning/views/home/widget/home_appbar.dart';
import 'package:e_learning/views/home/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  final List<Category> categories = [
    Category(id: '1', name: "Programming", icon: Icons.code, courseCount: 1),
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
            ]),
          ),
        ),
      ],
    );
  }
}
