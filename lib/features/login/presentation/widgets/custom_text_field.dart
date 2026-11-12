import 'package:facebook_ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final String? Function(String?) validator;
  const CustomTextField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: isObscure && widget.isPassword,
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.grayColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grayColor,
                  size: 22,
                ),
              )
            : SizedBox.shrink(),

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.grayColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.grayColor,
            width: 1,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        filled: true,
        fillColor: Color.fromRGBO(214, 223, 241, 0.47),
      ),
    );
  }
}
