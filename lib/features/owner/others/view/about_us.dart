import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('About Us', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [

                Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Terms & Conditions', style: AppTextStyle.black40416W400,),
                      Icon(Icons.chevron_right, color: orange, size: 30,)
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Privacy Policy', style: AppTextStyle.black40416W400,),
                      Icon(Icons.chevron_right, color: orange, size: 30,)
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Know more about Us', style: AppTextStyle.black40416W400,),
                      Icon(Icons.chevron_right, color: orange, size: 30,)
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