import 'package:flutter/material.dart';
import 'package:plant_shop/core/constants/assets.dart';
import 'package:plant_shop/core/constants/colors.dart';
import 'package:plant_shop/core/constants/dimens.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.s_6(),
        vertical: Dimens.verticalBlockSize * 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(IconsAsset.drawer, scale: 4),
    );
  }
}
