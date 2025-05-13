import 'package:flutter/material.dart';
import 'package:plant_shop/core/colors.dart';
import 'package:plant_shop/core/text_style.dart';

class AgreementView extends StatelessWidget {
  const AgreementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'I’ve read and agreed to ', // default style
        style: AppTextStyle.bodyRegular[14]?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.greyScale[30]!,
        ),
        children: [
          TextSpan(
            text: 'User Agreement\n',
            style: AppTextStyle.bodyRegular[14]?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: AppTextStyle.bodyRegular[14]?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.greyScale[30]!,
            ),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: AppTextStyle.bodyRegular[14]?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
