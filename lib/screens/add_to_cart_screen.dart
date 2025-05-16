import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:plant_shop/core/controller/main_controller.dart';
import 'package:plant_shop/core/model/plants_model.dart';
import 'package:plant_shop/core/utils/debouncer.dart';
import 'package:plant_shop/core/widgets/drawer_icon.dart';
import 'package:plant_shop/core/widgets/entry_list_item.dart';
import 'package:plant_shop/screens/cart_screen.dart';

import '../core/constants/constants.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key, required this.idx});

  final int idx;

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  RxInt pieceNumber = 1.obs;
  RxDouble piecePrice = 0.0.obs;
  final deBouncer = DeBouncer(milliSecond: 300);
  RxBool isTap = false.obs;

  _totalPieceCount() {
    piecePrice.value =
        MainController.to.plants[widget.idx].price * pieceNumber.value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    piecePrice.value = MainController.to.plants[widget.idx].price;
    pieceNumber.value = MainController.to.plants[widget.idx].piece;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 7),
            child: EntryListItem(index: 0, child: _appBar()),
          ),
          _plantView(),
          _incrementDecrementView(),
          _addToCartButton(),
        ],
      ),
    );
  }

  Widget _addToCartButton() {
    return EntryListItem(
      index: 5,
      child: Bounceable(
        onTap: () {
          if (!isTap.value) {
            isTap.value = true;
            deBouncer.run(() {
              MainController.to.plants[widget.idx] = MainController
                  .to
                  .plants[widget.idx]
                  .copyWith(price: piecePrice.value, piece: pieceNumber.value);
              PlantModel plants = MainController.to.plants[widget.idx];
              bool isExist = MainController.to.cart.any((item) {
                if (item.title == plants.title) {
                  int inx = MainController.to.cart.indexOf(item);
                  MainController.to.cart[inx] = MainController.to.cart[inx]
                      .copyWith(price: plants.price, piece: pieceNumber.value);
                  return true;
                }
                return false;
              });
              if (!isExist) {
                MainController.to.cart.add(plants);
              }
            });
          } else {
            _modalBottomSheetMenu();
          }
        },
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
              Obx(
                () => Text(
                  isTap.value ? 'View Cart' : 'Add to Cart',
                  style: AppTextStyle.bodyRegular[16]?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.satoshi,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(right: Dimens.s_15()),
                  child: Text(
                    '''\$${piecePrice.value.toStringAsFixed(2)}''',
                    style: AppTextStyle.bodyRegular[16]?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.satoshi,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _incrementDecrementView() {
    return EntryListItem(
      index: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bounceable(
            onTap: () {
              isTap.value = false;
              if (pieceNumber.value != 1) {
                pieceNumber.value -= 1;
              }
              _totalPieceCount();
            },
            child: Image.asset(IconsAsset.minus, scale: 4.2),
          ),
          Obx(
            () => Text(
              pieceNumber.value.toString().padLeft(2, '0'),
              style: AppTextStyle.bodyRegular[70]?.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.satoshi,
              ),
            ),
          ),
          Bounceable(
            onTap: () {
              isTap.value = false;
              pieceNumber.value += 1;
              _totalPieceCount();
            },
            child: Image.asset(IconsAsset.plus, scale: 4.2),
          ),
        ],
      ),
    );
  }

  Widget _plantView() {
    return Padding(
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
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,

      builder: (builder) {
        return CartScreen();
      },
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
