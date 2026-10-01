import 'package:e_learning/views/auth/widgets/soical_login_button.dart';
import 'package:flutter/material.dart';

class RowSocialButtons extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SoicalLoginButton(icon: Icons.g_mobiledata, onPressed: () {}),
        SizedBox(width: 10),
        SoicalLoginButton(icon: Icons.facebook, onPressed: () {}),
        SizedBox(width: 10),
        SoicalLoginButton(icon: Icons.apple, onPressed: () {}),
      ],
    );
  }
}
