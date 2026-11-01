import 'package:e_learning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.send, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
