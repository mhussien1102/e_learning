import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../widgets/common/custom_button.dart';

class AlertDialogColumn extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.mark_email_read_outlined, color: Colors.green, size: 60),
        SizedBox(height: 20),
        Text(
          "Check Your Email",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "We have sent Password Recovery Instructions To Your Email",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 20),
        CustomButton(text: "Ok", onPressed: () => Get.back(), height: 55),
      ],
    );
  }
}
