import 'package:flutter/material.dart';
import 'package:plant_shop/core/colors.dart';
import 'package:plant_shop/core/dimens.dart';
import 'package:plant_shop/core/text_style.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.btnTxt});
  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimens.verticalBlockSize * 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.green,
      ),
      child: Text(
        btnTxt,
        style: AppTextStyle.bodyRegular[14]?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
