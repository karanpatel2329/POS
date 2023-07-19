import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

import 'onboarding_1.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.onboarding_4,
            height: 255,
            width: 340,
          ),
          // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
          const SizedBox(height: 32),
          AppButtonStyle.ElevatedButtonStyled(
              'DARK',
              Text(
                'Access location',
                style: AppTextStyle.whiteText14W600,
              ),
              () {}),
          AppButtonStyle.ElevatedButtonStyledUnchecked(
              'LIGHT',
              Text(
                'Skip For Now',
                style: AppTextStyle.saffron14W600,
              ),
              () {})
        ],
      ),
    );
  }
}
