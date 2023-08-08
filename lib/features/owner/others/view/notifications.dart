import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Notifications', style: AppTextStyle.black40420W600,),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text('CLEAR', style: TextStyle(decoration: TextDecoration.underline, color: orange, fontSize: 14, fontWeight: FontWeight.w600),),
          )
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [

                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: orange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImagePath.orderIcon, color: orange,),
                        SizedBox(
                          width: 16 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: AppTextStyle.black40414W600,),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            Text('You have received a new order.', style: AppTextStyle.black40412W400,),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),

                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: orange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImagePath.settingsIcon, color: orange, height: 24,),
                        SizedBox(
                          width: 16 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('System', style: AppTextStyle.black40414W600,),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            Text('You have received a new message\nabout system update.', style: AppTextStyle.black40412W400,),
                          ],
                        ),
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