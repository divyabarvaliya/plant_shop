import 'package:flutter/material.dart';
import 'package:plant_shop/core/colors.dart';
import 'package:plant_shop/core/dimens.dart';
import 'package:plant_shop/core/text_style.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.ctrl,
    this.suffixIcon,
    required this.keyboardType,
    required this.hintText,
    this.isObscureText = false,
  });
  final TextEditingController ctrl;
  final Widget? suffixIcon;
  final bool isObscureText;
  final TextInputType keyboardType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText,
      controller: ctrl,
      style: AppTextStyle.bodyRegular[14]?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.bodyRegular[14]?.copyWith(
          color: AppColors.greyScale[10]!,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.s_15(),
          vertical: Dimens.verticalBlockSize * 2,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyScale[10]!),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
    );
  }
}
