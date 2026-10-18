import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/courses/payment/widgets/payment_success_dialog.dart';

class PaymentService {
  static void processPayment({
    required GlobalKey<FormState> formKey,
    required String courseId,
  }) {
    if (formKey.currentState!.validate()) {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      //Simulate
      Future.delayed(Duration(seconds: 2), () {
        Get.back(); // close the dialog

        //add the course purchase
        DummyDataServices.addPurchasedCourse(courseId);
        Get.dialog(PaymentSuccessDialog(), barrierDismissible: false);
      });
    }
  }
}
