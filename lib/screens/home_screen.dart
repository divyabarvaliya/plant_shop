import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:plant_shop/core/constants/constants.dart';
import 'package:plant_shop/core/controller/main_controller.dart';
import 'package:plant_shop/core/model/plants_model.dart';
import 'package:plant_shop/core/utils/snackbar.dart';
import 'package:plant_shop/core/widgets/drawer_icon.dart';
import 'package:plant_shop/core/widgets/entry_list_item.dart';
import 'package:plant_shop/screens/add_to_cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.offWhite, AppColors.lightSky],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 7),
              child: _appBar(),
            ),
            _categoryView(),
            _plantsColl(),
            _plantsSwipe(),
            Spacer(),
            _itemInCart(),
          ],
        ),
      ),
    );
  }

  Widget _plantsColl() {
    return EntryListItem(
      index: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plant Collections',
              style: AppTextStyle.bodyRegular[24]?.copyWith(
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.satoshi,
              ),
            ),
            Image.asset(IconsAsset.forwardArrow, scale: 4),
          ],
        ),
      ),
    );
  }

  Widget _itemInCart() {
    return EntryListItem(
      index: 5,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.lightGreen,
              ),
              height: 4,
              width: Dimens.s_55(),
            ),
          ),
          Image.asset(ImagesAsset.cartRec),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
              child: Obx(
                () => Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 24,
                      child: Text(
                        '${MainController.to.cart.length}',
                        style: AppTextStyle.bodyRegular[24]?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.satoshi,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: Dimens.s_10()),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cart',
                          style: AppTextStyle.bodyRegular[20]?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.satoshi,
                          ),
                        ),
                        SizedBox(height: Dimens.verticalBlockSize * 0.6),
                        Text(
                          '${MainController.to.cart.length} items',
                          style: AppTextStyle.bodyRegular[14]?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.satoshi,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Dimens.screenWidth / 1.7,
                      child: Stack(
                        alignment: Alignment.center,
                        children: List.generate(MainController.to.cart.length, (
                          index,
                        ) {
                          PlantModel item = MainController.to.cart[index];
                          return Positioned(
                            right: index * 25,
                            child: AnimatedOpacity(
                              key: Key('$index'),
                              duration: Duration(milliseconds: 700),
                              opacity: 1,
                              child: EntryListItem(
                                index: index,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.lightGreen,
                                  radius: 24,
                                  child: CircleAvatar(
                                    radius: 22,
                                    child: Image.asset(
                                      item.img,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _plantsSwipe() {
    return EntryListItem(
      index: 4,
      child: Padding(
        padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                ImagesAsset.homeBac1,
                height: Dimens.verticalBlockSize * 40,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                ImagesAsset.homeBac2,
                height: Dimens.verticalBlockSize * 40,
              ),
            ),
            SizedBox(
              height: Dimens.verticalBlockSize * 47,
              child: CardSwiper(
                padding: EdgeInsets.zero,
                cardsCount: MainController.to.plants.length,
                cardBuilder: (
                  context,
                  index,
                  percentThresholdX,
                  percentThresholdY,
                ) {
                  PlantModel plants = MainController.to.plants[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => AddToCartScreen(idx: index),
                        transition: Transition.fade,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimens.s_45()),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.s_15(),
                        vertical: Dimens.verticalBlockSize * 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                        boxShadow: [AppColors.boxShadow],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: Dimens.verticalBlockSize * 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.cloudMist,
                                ),
                              ),
                              Positioned(
                                bottom: -Dimens.verticalBlockSize * 14,
                                left: 0,
                                right: 0,
                                child: Hero(
                                  tag: 'plant_$index',
                                  child: Image.asset(
                                    plants.img,
                                    height: Dimens.verticalBlockSize * 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimens.verticalBlockSize * 1.5,
                            ),
                            child: Text(
                              plants.title,
                              style: AppTextStyle.bodyRegular[24]?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.satoshi,
                              ),
                            ),
                          ),
                          Text(
                            plants.dec,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyRegular[12]?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.satoshi,
                              color: AppColors.greyScale[40],
                            ),
                          ),
                          Bounceable(
                            onTap: () {
                              bool isExist = MainController.to.cart.any(
                                (item) => item.title == plants.title,
                              );
                              if (!isExist) {
                                MainController.to.cart.add(plants);
                                MainController.to.cart.refresh();
                              } else {
                                SnackBarUtil.showToasts(
                                  message: '${plants.title} already in cart',
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: Dimens.verticalBlockSize * 2.5,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: Dimens.verticalBlockSize * 1.7,
                                horizontal: Dimens.s_15(),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(42),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(IconsAsset.bin, scale: 4),
                                  SizedBox(width: Dimens.s_8()),
                                  Text(
                                    'Add to Cart',
                                    style: AppTextStyle.bodyRegular[16]
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.satoshi,
                                          color: Colors.white,
                                        ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$${plants.price.toStringAsFixed(2)}',
                                    style: AppTextStyle.bodyRegular[16]
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.satoshi,
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return EntryListItem(
      index: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: 'Let’s Make our\n', // default style
                style: AppTextStyle.bodyRegular[30]?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.satoshi,
                  height: 1.2,
                ),
                children: [
                  TextSpan(
                    text: 'lives ',
                    style: AppTextStyle.bodyRegular[30]?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.satoshi,
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: 'Greener',
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
      ),
    );
  }

  Widget _categoryView() {
    return EntryListItem(
      index: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimens.verticalBlockSize * 3),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
            child: Row(
              children:
                  MainController.to.plantsCategory.map((cn) {
                    int idx = MainController.to.plantsCategory.indexOf(cn);
                    return Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              MainController.to.selCate.value = idx;
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: Dimens.s_3()),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimens.s_10(),
                                vertical: Dimens.verticalBlockSize * 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimens.s_12(),
                                  vertical: Dimens.verticalBlockSize * 0.8,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      MainController.to.selCate.value == idx
                                          ? AppColors.lightGreen
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Text(
                                  cn,
                                  style: AppTextStyle.bodyRegular[14]?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.satoshi,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (idx != 0)
                          Container(
                            height: Dimens.verticalBlockSize * 1.6,
                            width: Dimens.s_8(),
                            color: Colors.white,
                          ),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
