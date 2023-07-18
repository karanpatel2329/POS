import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/auth/view/onboarding_2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Align(
            alignment: Alignment.topRight,
            child: Text('Skip', style: AppTextStyle.normal17)
          ),

          Image.asset(
            ImagePath.welcomeScreenImage,
            height: 255,
            width: 340,
          ),
          // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),

          const SizedBox(height: 32),
          Text(
            'Grow Your Business',
            style: AppTextStyle.openSans16W700,
          ),

          const SizedBox(height: 16),
          Text(
            'Offer welcoming atmosphere \nto keep customers coming \nback and encourage positive \nword-of-mouth.',
            style: AppTextStyle.openSans16W700,textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 11,
                width: 11,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: saffron
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                height: 11,
                width: 11,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: grey
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                height: 11,
                width: 11,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: grey
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),
          AppButtonStyle.ElevatedButtonStyled(
              'DARK',
              Text(
                'Next',
                style: AppTextStyle.whiteText14W600,
              ),
              () {Get.to(Onboarding2());}),
        ],
      ),
    );
  }
}
