import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../constants/constants.dart';

class OtherSignIn extends StatelessWidget {
  const OtherSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'other way to sign in',
          textAlign: TextAlign.center,
          style: AppTextStyle.bodyRegular[12]?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.greyScale[30]!,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.verticalBlockSize * 2,
            bottom: Dimens.verticalBlockSize * 4,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Bounceable(
                onTap: () {},
                child: Image.asset(IconsAsset.google, scale: 4),
              ),
              SizedBox(width: Dimens.s_6()),
              Bounceable(
                onTap: () {},
                child: Image.asset(IconsAsset.fb, scale: 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
