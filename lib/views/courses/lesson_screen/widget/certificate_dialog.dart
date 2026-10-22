import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificateDialog extends StatelessWidget {
  final Course course;
  final VoidCallback onDownload;

  const CertificateDialog({
    super.key,
    required this.course,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Congratulations! "),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.workspace_premium, size: 64, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            "You have completed all lesson in ${course.title}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "You can download your certificate of completion",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.secondary),
          ),
        ],
      ),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  onDownload();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  backgroundColor: AppColors.primary,
                ),
                child: Text(
                  "Later",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
