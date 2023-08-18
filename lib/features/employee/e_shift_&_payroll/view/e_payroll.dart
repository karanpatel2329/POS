import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';

class EPayrollScreen extends StatelessWidget {
  const EPayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // App Bar Content

      appBar: AppBar(
        backgroundColor: white,
        scrolledUnderElevation: 0,
        title: Text('Payroll', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: orange),
                  ),

                  child: RichText(text: TextSpan(
                    text: 'On 1/06/2023 Your A/cX4012\nis credited by ₹30,000 by Chop Chop\nRestaurant(Ref no ',
                    style: AppTextStyle.black40416W600,
                    children: <TextSpan>[
                      TextSpan(text: '123456789', style: AppTextStyle.blueText16W400),
                      const TextSpan(text: ')'),
                    ],
                  ),)
                  // child: Text("On 1/06/2023 Your A/cX4012\nis credited by ₹30,000 by Chop Chop\nRestaurant(Ref no 123456789)", style: AppTextStyle.black40416W600,),
                ),

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

              ],
            ),
          )
        ),
      ),

    );
  }
}
