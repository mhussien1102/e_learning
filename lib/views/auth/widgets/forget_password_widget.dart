import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/routes/appRoutes.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Get.offNamed(AppRoutes.forgetPassword),
        child: Text(
          "Forget Password?",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
