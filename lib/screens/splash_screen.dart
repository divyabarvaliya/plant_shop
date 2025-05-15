import 'package:flutter/material.dart';
import 'package:plant_shop/core/constants/assets.dart';
import 'package:plant_shop/core/constants/dimens.dart';
import 'package:plant_shop/screens/sign_in__screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  Future<void> goToNextPage() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimens().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: Dimens.screenHeight,
            width: Dimens.screenWidth,
            child: Image.asset(ImagesAsset.background, fit: BoxFit.fill),
          ),
          Image.asset(IconsAsset.logo, scale: 4),
        ],
      ),
    );
  }
}
