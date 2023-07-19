import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

import 'onboarding_1.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.welcomeScreenImage,
            height: 255,
            width: 340,
          ),
          // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
          const SizedBox(height: 32),
          AppButtonStyle.ElevatedButtonStyled(
              'DARK',
              Text(
                'I’m an Owner',
                style: AppTextStyle.whiteText14W600,
              ),
              () {Get.to(Onboarding1());}),
          AppButtonStyle.ElevatedButtonStyledUnchecked(
              'LIGHT',
              Text(
                'I’m An Employee',
                style: AppTextStyle.saffron14W600,
              ),
              () {})
        ],
      ),
    );
  }
}
