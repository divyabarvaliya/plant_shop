import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:plant_shop/controller/main_controller.dart';
import 'package:plant_shop/core/widgets/drawer_icon.dart';

import '../core/constants/constants.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key, required this.idx});

  final int idx;

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 7),
            child: _appBar(),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 0.6),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImagesAsset.plantsBc),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: Dimens.s_140(),
                    width: Dimens.s_140(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.cloud, AppColors.offWhite],
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: 'plant_${widget.idx}',
                  child: Image.asset(
                    MainController.to.plants[widget.idx].img,
                    height: Dimens.verticalBlockSize * 40,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Dimens.s_60(),
              right: Dimens.s_60(),
              top: Dimens.verticalBlockSize * 4,
            ),
            child: Text(
              textAlign: TextAlign.center,
              MainController.to.plants[widget.idx].dec,
              style: AppTextStyle.bodyRegular[12]?.copyWith(
                fontWeight: FontWeight.w400,
                height: 1.2,
                fontFamily: FontFamily.satoshi,
                color: AppColors.greyScale[40],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(IconsAsset.minus, scale: 4.2),
              Text(
                '02',
                style: AppTextStyle.bodyRegular[70]?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.satoshi,
                ),
              ),
              Image.asset(IconsAsset.plus, scale: 4.2),
            ],
          ),
          Bounceable(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
              padding: EdgeInsets.symmetric(
                vertical: Dimens.verticalBlockSize * 0.8,
                horizontal: Dimens.s_6(),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(42),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: Dimens.s_24(),
                    backgroundColor: AppColors.lightGreen,
                    child: Image.asset(
                      IconsAsset.bin,
                      scale: 4,

                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: Dimens.s_8()),
                  Text(
                    'Add to Cart',
                    style: AppTextStyle.bodyRegular[16]?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.satoshi,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: Dimens.s_15()),
                    child: Text(
                      '\$50.00',
                      style: AppTextStyle.bodyRegular[16]?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.satoshi,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    List<String> title = MainController.to.plants[widget.idx].title.split(' ');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              text: title[0], // default style
              style: AppTextStyle.bodyRegular[30]?.copyWith(
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.satoshi,
                height: 1.2,
              ),
              children: [
                TextSpan(
                  text: ' ${title[1]}\n',
                  style: AppTextStyle.bodyRegular[30]?.copyWith(
                    fontWeight:
                        title.length == 2 ? FontWeight.w900 : FontWeight.w400,
                    fontFamily: FontFamily.satoshi,
                    height: 1.2,
                  ),
                ),
                if (title.length == 3)
                  TextSpan(
                    text: title[2],
                    style: AppTextStyle.bodyRegular[30]?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontFamily: FontFamily.satoshi,
                    ),
                  ),
              ],
            ),
          ),
          DrawerIcon(),
        ],
      ),
    );
  }
}
