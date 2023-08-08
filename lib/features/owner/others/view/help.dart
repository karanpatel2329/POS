import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

class HelpScreen extends StatefulWidget {
  HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Help', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [

                Text('Hello!\nHow can we help you ?', style: AppTextStyle.black40416W600, textAlign: TextAlign.center,),

                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImagePath.supportIcon),
                      SizedBox(
                        width: 16 * (SizeConfig.widthMultiplier ?? 1),
                      ),
                      Text('Support', style: AppTextStyle.black40416W400,),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImagePath.contactIcon),
                      SizedBox(
                        width: 16 * (SizeConfig.widthMultiplier ?? 1),
                      ),
                      Text('Contact Us', style: AppTextStyle.black40416W400,),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImagePath.faqIcon),
                      SizedBox(
                        width: 16 * (SizeConfig.widthMultiplier ?? 1),
                      ),
                      Text('FAQs', style: AppTextStyle.black40416W400,),
                    ],
                  ),
                ),
  
              ],
                 
               
              
            ),
          ),
        ),
      ),
    );
  }
}