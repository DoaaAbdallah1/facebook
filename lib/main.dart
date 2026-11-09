import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'features/login/presentation/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: AppColors.blueColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor),
      ),
      home: LoginScreen(),
    );
  }
}
