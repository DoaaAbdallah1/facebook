import 'package:facebook_ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isColor;
  const ButtonCustom({
    super.key,
    required this.text,
    required this.onPressed,
    this.isColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,

      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),
        backgroundColor: WidgetStatePropertyAll(
          isColor ? AppColors.blueColor : Colors.transparent,
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.blueColor, width: 1),
          ),
        ),
      ),

      child: Text(
        text,
        style: TextStyle(
          color: isColor ? Colors.white : AppColors.blueColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
