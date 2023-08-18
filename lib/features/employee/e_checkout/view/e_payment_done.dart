import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_dashboard/view/e_dashboard.dart';

class EPaymentDoneScreen extends StatelessWidget {
  const EPaymentDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // Body Content

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 56 * (SizeConfig.heightMultiplier ?? 1),
              ),
              SvgPicture.asset(ImagePath.paymentConfirm),
              SizedBox(
                height: 40 * (SizeConfig.heightMultiplier ?? 1),
              ),
              Text('Payment Successful', style: AppTextStyle.black40420W500, textAlign: TextAlign.center),
              SizedBox(
                height: 8 * (SizeConfig.heightMultiplier ?? 1),
              ),
              Text('Your payment is successfully \ncompleted.', style: AppTextStyle.black40412W400, textAlign: TextAlign.center,),
              SizedBox(
                height: 40 * (SizeConfig.heightMultiplier ?? 1),
              ),
              AppButtonStyle.ElevatedButtonStyled('Light', Text('EXIT', style: AppTextStyle.orange14W600,), () {Get.offAll(EDashboard());})
        
              
            ],
          ),
        )
      )
    );
  }
}