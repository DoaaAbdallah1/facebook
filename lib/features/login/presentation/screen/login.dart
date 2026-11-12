import 'package:facebook_ui/core/constants/app_assets.dart';
import 'package:facebook_ui/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/button_custom.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? validateEmailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email or mobile number';
    }

    final input = value.trim();

    // Email validation
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (emailRegex.hasMatch(input)) {
      return null;
    }

    // Phone validation
    final phone = input.replaceAll(RegExp(r'[\s()-]'), '');

    final phoneRegex = RegExp(r'^\+?\d{7,15}$');

    if (phoneRegex.hasMatch(phone)) {
      return null;
    }

    return 'Please enter a valid email or mobile number';
  }

  // Validate Password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [
                              SizedBox(height: 60),
                              SvgPicture.asset(
                                AppAssets.logoImgSVG,
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 60),
                              CustomTextField(
                                hintText: "Mobile Number or Email Address",
                                validator: validateEmailOrPhone,
                              ),
                              SizedBox(height: 20),
                              CustomTextField(
                                hintText: "Password",
                                isPassword: true,
                                validator: validatePassword,
                              ),
                              SizedBox(height: 30),
                              // button login
                              ButtonCustom(
                                text: "Login",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print("All fields are valid");
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  } else {
                                    print("Please check your inputs");
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgotten Password ?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.grayColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ButtonCustom(
                                text: "Create Account",
                                onPressed: () {},
                                isColor: false,
                              ),

                              SizedBox(height: 10),
                              SvgPicture.asset(
                                AppAssets.metaLogoSVG,
                                width: 98,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
