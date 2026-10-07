import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/views/home/widget/text_in_card.dart';
import 'package:e_learning/views/home/widget/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'is_premium_widget.dart';

class RecommendedCourseCard extends StatelessWidget {
  final String courseId;
  final String title;
  final String imageUrl;
  final String instructorId;
  final String duration;
  final bool isPremium;

  const RecommendedCourseCard({
    super.key,
    required this.courseId,
    required this.title,
    required this.imageUrl,
    required this.instructorId,
    required this.duration,
    required this.isPremium,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16, bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: AppColors.primary.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
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
                      imageUrl: imageUrl,
                      height: 90,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: AppColors.primary.withValues(alpha: 0.1),
                        highlightColor: AppColors.accent,
                        child: Container(
                          height: 90,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (isPremium) IsPremiumWidget(),
                ],
              ),
              TextInCard(title: title, instructorId: instructorId),
              SizedBox(height: 4),
              TimeWidget(duration: duration),
            ],
          ),
        ),
      ),
    );
  }
}
