import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/course.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TeacherCourseCard extends StatelessWidget {
  final Course course;

  const TeacherCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: course.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: AppColors.primary.withValues(alpha: 0.1),
                        highlightColor: AppColors.accent,
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 180,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 180,
                        color: AppColors.primary,
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (course.isPremium)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: AppColors.accent, size: 16),
                            SizedBox(width: 4),
                            Text(
                              "Premium",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.people, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text(
                          '${course.enrollmentCount} student',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(width: 16),
                        Text(
                          course.rating.toString(),
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${course.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            //code
                          },
                          icon: Icon(Icons.edit),
                          label: Text("Edit"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
