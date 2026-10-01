import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/utils/vaildators.dart';
import 'package:e_learning/views/auth/widgets/back_ground_app.dart';
import 'package:e_learning/views/auth/widgets/forget_password_widget.dart';
import 'package:e_learning/views/auth/widgets/register_row.dart';
import 'package:e_learning/views/auth/widgets/row_social_buttons.dart';
import 'package:e_learning/views/auth/widgets/seprator_divider.dart';
import 'package:e_learning/views/auth/widgets/soical_login_button.dart';
import 'package:e_learning/views/widgets/common/custom_button.dart';
import 'package:e_learning/views/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackGroundApp(size: size),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Email",
                          prefixIcon: Icons.email_outlined,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidator.validateEmail,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: "password",
                          prefixIcon: Icons.lock_outline,
                          controller: _passwordController,
                          obscureText: true,
                          validator: FormValidator.validatePassword,
                        ),
                        SizedBox(height: 10),
                        ForgetPasswordWidget(),
                        SizedBox(height: 20),
                        CustomButton(text: "Login", onPressed: _handleLogin),
                      ],
                    ),
                  ),
                  //Email Field
                  //Password Field

                  SizedBox(height: 20),
                  //soical Login
                  SeprateorDivider(),
                  SizedBox(height: 20),
                  RowSocialButtons(), SizedBox(height: 20),
                  //Sign Up Button
                  RegisterRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
