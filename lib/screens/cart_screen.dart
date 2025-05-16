import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_shop/core/controller/main_controller.dart';
import 'package:plant_shop/core/model/plants_model.dart';
import 'package:plant_shop/core/widgets/entry_list_item.dart';

import '../core/constants/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  RxDouble totalAmt = 0.0.obs;

  _countTotalAmt() {
    for (int i = 0; i < MainController.to.cart.length; i++) {
      totalAmt.value += MainController.to.cart[i].price;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _countTotalAmt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimens.verticalBlockSize * 7,
              bottom: Dimens.verticalBlockSize * 1.5,
            ),
            child: _appBar(),
          ),
          Spacer(),
          _bottomPart(),
        ],
      ),
    );
  }

  Widget _bottomPart() {
    return Container(
      height: Dimens.screenHeight / 1.17,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesAsset.cartBc),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Dimens.verticalBlockSize * 55,
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: Dimens.verticalBlockSize * 5,
                left: Dimens.s_20(),
                right: Dimens.s_20(),
              ),
              shrinkWrap: true,
              itemBuilder: (c, idx) {
                PlantModel cart = MainController.to.cart[idx];
                return EntryListItem(
                  index: idx,
                  child: Row(
                    children: [
                      Container(
                        height: Dimens.s_60(),
                        width: Dimens.s_60(),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.cloud, AppColors.offWhite],
                          ),
                        ),
                        child: Image.asset(cart.img),
                      ),
                      SizedBox(width: Dimens.s_10()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cart.title, // default style
                            style: AppTextStyle.bodyRegular[18]?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.satoshi,
                            ),
                          ),
                          SizedBox(height: Dimens.verticalBlockSize * 0.2),
                          Text(
                            '${cart.piece} piece', // default style
                            style: AppTextStyle.bodyRegular[14]?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.satoshi,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: Dimens.s_90(),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: Dimens.verticalBlockSize * 1.4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        child: Text(
                          '\$${cart.price.toStringAsFixed(2)}',
                          style: AppTextStyle.bodyRegular[16]?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.satoshi,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (sC, sI) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Dimens.verticalBlockSize * 2,
                  ),
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.green.withOpacity(0.3)),
                  ),
                );
              },
              itemCount: MainController.to.cart.length,
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(ImagesAsset.paymentBc),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
                child: Column(
                  children: [
                    EntryListItem(
                      index: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Amount',
                            style: AppTextStyle.bodyRegular[16]?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.satoshi,
                            ),
                          ),
                          Text(
                            '\$25.50',
                            style: AppTextStyle.bodyRegular[20]?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.satoshi,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Dimens.verticalBlockSize * 2,
                      ),
                      height: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    EntryListItem(
                      index: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: AppTextStyle.bodyRegular[18]?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.satoshi,
                            ),
                          ),
                          Obx(
                            () => Text(
                              '\$${totalAmt.value.toStringAsFixed(2)}',
                              style: AppTextStyle.bodyRegular[24]?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.satoshi,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    EntryListItem(
                      index: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimens.verticalBlockSize * 3,
                        ),
                        child: ActionSlider.standard(
                          backgroundColor: Colors.black,
                          toggleColor: AppColors.lightGreen,
                          child: Text(
                            'Make Payment',
                            style: AppTextStyle.bodyRegular[18]?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.satoshi,
                              color: Colors.white,
                            ),
                          ),

                          action: (controller) async {
                            controller.loading(); //starts loading animation
                            await Future.delayed(const Duration(seconds: 3));
                            controller.success(); //starts success animation
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
            Text(
              'Cart', // default style
              style: AppTextStyle.bodyRegular[30]?.copyWith(
                fontWeight: FontWeight.w900,
                fontFamily: FontFamily.satoshi,
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.lightGreen,
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
          ],
        ),
      ),
    );
  }
}
