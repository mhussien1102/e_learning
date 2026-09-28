import 'package:e_learning/views/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

class SoicalLoginButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SoicalLoginButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      icon: icon,
      isFullWidth: false,
      text: '',
      height: 50,
      isOutlined: true,
      onPressed: onPressed,
    );
  }
}
