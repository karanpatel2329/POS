import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_dashboard/view/e_dashboard.dart';

class EOTPScreen extends StatelessWidget {
  const EOTPScreen({super.key});


  static TextEditingController box1 = TextEditingController();  
  static TextEditingController box2 = TextEditingController();  
  static TextEditingController box3 = TextEditingController();  
  static TextEditingController box4 = TextEditingController();  

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [

                Image.asset(
                  ImagePath.otpScreenImage,
                  height: 255,
                  width: 340,
                ),

                Text('Enter Passcode', style: AppTextStyle.normalText20W700,),
                Text('Enter the Passcode send by the owner ', style: AppTextStyle.black40414W400,),

                SizedBox(
                  height: 42 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 54 * (SizeConfig.widthMultiplier ?? 1),
                            child: TextFormField(
                              controller: box1,
                              decoration: InputDecoration(
                                labelStyle: AppTextStyle.black40416W400,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: orange,
                                    width: 1.0,
                                  ),
                                ),focusedBorder: const OutlineInputBorder( 
                                    borderSide: BorderSide(
                                        width: 1.0, color: orange), 
                                  ),
                              ),
                              
                            ),
                          ),
                          SizedBox(
                            width: 16 * (SizeConfig.heightMultiplier ?? 1),
                          ),
        
                          SizedBox(
                            width: 54 * (SizeConfig.widthMultiplier ?? 1),
                            child: TextFormField(
                              controller: box2,
                              decoration: InputDecoration(
                                labelStyle: AppTextStyle.black40416W400,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: orange,
                                    width: 1.0,
                                  ),
                                ),focusedBorder: const OutlineInputBorder( 
                                    borderSide: BorderSide(
                                        width: 1.0, color: orange), 
                                  ),
                              ),
                              
                            ),
                          ),
        
                          SizedBox(
                            width: 16 * (SizeConfig.heightMultiplier ?? 1),
                          ),
        
                          SizedBox(
                            width: 54 * (SizeConfig.widthMultiplier ?? 1),
                            child: TextFormField(
                              controller: box3,
                              decoration: InputDecoration(
                                labelStyle: AppTextStyle.black40416W400,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: orange,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder( 
                                    borderSide: BorderSide(
                                        width: 1.0, color: orange), 
                                ),
                              ),
                              
                            ),
                          ),
        
                          SizedBox(
                            width: 16 * (SizeConfig.heightMultiplier ?? 1),
                          ),
        
                          SizedBox(
                            width: 54 * (SizeConfig.widthMultiplier ?? 1),
                            child: TextFormField(
                              controller: box4,
                              decoration: InputDecoration(
                                labelStyle: AppTextStyle.black40416W400,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: orange,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder( 
                                    borderSide: BorderSide(
                                        width: 1.0, color: orange), 
                                ),
                                
                              ),
                              
                            ),
                          ),
        
                          SizedBox(height: 92 * (SizeConfig.heightMultiplier ?? 1),),
        
                        ],
                      ),
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('VERIFY', style: AppTextStyle.whiteText14W600,), () {Get.to(EDashboard());}),

                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}