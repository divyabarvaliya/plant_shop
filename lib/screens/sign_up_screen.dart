import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:plant_shop/core/widgets/agreement_view.dart';
import 'package:plant_shop/core/widgets/button.dart';
import 'package:plant_shop/core/widgets/entry_list_item.dart';
import 'package:plant_shop/core/widgets/other_sign_in.dart';
import 'package:plant_shop/core/widgets/text_field.dart';
import 'package:plant_shop/screens/home_screen.dart';
import 'package:plant_shop/screens/sign_in__screen.dart';

import '../core/constants/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPwdVisible = false;
  bool isCPwdVisible = false;
  bool accept = false;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  TextEditingController confirmPwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.verticalBlockSize * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _logo(),
                _title(),
                _emailPwdView(),
                EntryListItem(index: 10, child: OtherSignIn()),
                _signInAct(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return EntryListItem(
      index: 0,
      child: Image.asset(IconsAsset.logo_2, scale: 3.5),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.verticalBlockSize * 4,
        bottom: Dimens.verticalBlockSize * 4,
      ),
      child: EntryListItem(
        index: 1,
        child: Text(
          'Crete new account',
          style: AppTextStyle.bodyRegular[20]?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }

  Widget _emailPwdView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 0.9),
            child: EntryListItem(
              index: 2,
              child: Text(
                'Email Address',
                textAlign: TextAlign.start,
                style: AppTextStyle.bodyRegular[14]?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          EntryListItem(
            index: 3,
            child: Bounceable(
              onTap: () {},
              child: CommonTextField(
                hintText: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
                ctrl: emailCtrl,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimens.verticalBlockSize * 2,
              bottom: Dimens.verticalBlockSize * 0.9,
            ),
            child: EntryListItem(
              index: 4,
              child: Text(
                'Password',
                textAlign: TextAlign.start,
                style: AppTextStyle.bodyRegular[14]?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          EntryListItem(
            index: 5,
            child: CommonTextField(
              hintText: 'Enter your password',
              isObscureText: !isPwdVisible,
              keyboardType: TextInputType.visiblePassword,
              ctrl: pwdCtrl,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isPwdVisible = !isPwdVisible;
                  });
                },
                child: Icon(
                  isPwdVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.greyScale[10]!,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimens.verticalBlockSize * 2,
              bottom: Dimens.verticalBlockSize * 0.9,
            ),
            child: EntryListItem(
              index: 6,
              child: Text(
                'Confirm Password',
                textAlign: TextAlign.start,
                style: AppTextStyle.bodyRegular[14]?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          EntryListItem(
            index: 7,
            child: CommonTextField(
              hintText: 'Enter your confirm password',
              isObscureText: !isCPwdVisible,
              keyboardType: TextInputType.visiblePassword,
              ctrl: confirmPwdCtrl,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isCPwdVisible = !isCPwdVisible;
                  });
                },
                child: Icon(
                  isCPwdVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.greyScale[10]!,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.verticalBlockSize * 4,
            ),
            child: EntryListItem(
              index: 8,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        accept = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyScale[20]!,
                      ),
                      child: AnimatedOpacity(
                        opacity: accept ? 1 : 0,
                        duration: Duration(milliseconds: 700),
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimens.s_10()),
                  AgreementView(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 2),
            child: EntryListItem(
              index: 9,
              child: Bounceable(
                onTap: () {
                  Get.to(() => HomeScreen());
                },
                child: Button(btnTxt: 'Sign up'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInAct() {
    return EntryListItem(
      index: 11,
      child: Text.rich(
        TextSpan(
          text: 'Already have an account? ', // default style
          style: AppTextStyle.bodyRegular[12]?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.greyScale[30]!,
          ),
          children: [
            TextSpan(
              text: 'Back to Sign In',
              style: AppTextStyle.bodyRegular[12]?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.green,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      emailCtrl.clear();
                      pwdCtrl.clear();
                      confirmPwdCtrl.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
