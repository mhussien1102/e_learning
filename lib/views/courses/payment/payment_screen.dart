import 'package:e_learning/core/services/payment_services.dart';
import 'package:e_learning/views/courses/payment/widgets/order_summary.dart';
import 'package:e_learning/views/courses/payment/widgets/payment_fields.dart';
import 'package:e_learning/views/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/theme/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  final String courseId;
  final String courseName;
  final double price;

  const PaymentScreen({
    super.key,
    required this.courseId,
    required this.courseName,
    required this.price,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _namerController = TextEditingController();
  final _errorStyle = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Screen", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSummary(courseName: widget.courseName, price: widget.price),
            SizedBox(height: 24),
            PaymentFields(
              formKey: _formKey,
              cardNumberController: _cardNumberController,
              expiryController: _expiryController,
              cvvController: _cvvController,
              nameController: _namerController,
              errorStyle: _errorStyle,
            ),
            SizedBox(height: 32),
            CustomButton(
              text: "pay \$${widget.price}",
              onPressed: () => PaymentService.processPayment(
                formKey: _formKey,
                courseId: widget.courseId,
              ),
              isLoading: false,
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
