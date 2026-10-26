import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class DividerNotification extends StatelessWidget {
  const DividerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: AppColors.primary.withValues(alpha: 0.1));
  }
}
