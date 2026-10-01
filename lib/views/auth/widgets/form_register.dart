import 'package:flutter/material.dart';

import '../../../core/utils/vaildators.dart';
import '../../widgets/common/custom_text_field.dart';

class FormRegister extends StatelessWidget {
  const new({
    super.key,
    required this._formKey,
    required this._fullNameController,
    required this._emailController,
    required this._passwordController,
    required this._confirmPasswordController,
  });

  final GlobalKey<FormState> _formKey;
  final TextEditingController _fullNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: "FullName",
            prefixIcon: Icons.person_outline,
            controller: _fullNameController,
            validator: FormValidator.validateFullName,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: "Email",
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: FormValidator.validateEmail,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: "Password",
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            controller: _passwordController,
            validator: FormValidator.validatePassword,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: "Confirm Password",
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            controller: _confirmPasswordController,
            validator: (value) => FormValidator.validateConfirmPassword(
              value,
              _passwordController.text,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
