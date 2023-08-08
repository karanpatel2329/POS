import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Settings', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [

                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 5),
                      child: Image.asset(ImagePath.restaurantDetails1),
                    ),
                    Image.asset(ImagePath.restaurantDetails2),

                  ],
                ),

                SizedBox(
                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Text('Chop Chop', style: AppTextStyle.black40414W600,),

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
                      Text('Update Profile', style: AppTextStyle.black40416W400,),
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
                      Text('Update Profile', style: AppTextStyle.black40416W400,),
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