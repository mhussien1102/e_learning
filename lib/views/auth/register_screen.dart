import 'package:e_learning/core/routes/appRoutes.dart';
import 'package:e_learning/core/utils/vaildators.dart';
import 'package:e_learning/views/auth/widgets/back_groundRegister.dart';
import 'package:e_learning/views/auth/widgets/form_register.dart';
import 'package:e_learning/views/auth/widgets/row_login_link.dart';
import 'package:e_learning/views/widgets/common/custom_button.dart';
import 'package:e_learning/views/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserRole? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackgroundRegister(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  FormRegister(
                    formKey: _formKey,
                    fullNameController: _fullNameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<UserRole>(
                    decoration: InputDecoration(
                      labelText: "Role",
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    value: _selectedRole,
                    items: UserRole.values.map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(
                          role.toString().split('.').last.capitalize!,
                        ),
                      );
                    }).toList(),
                    onChanged: (UserRole? value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  CustomButton(text: "Register", onPressed: _handleRegister),
                  SizedBox(height: 30),
                  RowLoginLink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate() && _selectedRole != null) {
      if (_selectedRole == UserRole.teacher) {
        Get.offAllNamed(AppRoutes.teacherHome);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    } else if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select the role"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
