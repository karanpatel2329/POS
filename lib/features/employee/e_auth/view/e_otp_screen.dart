import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_auth/controller/employee_auth_controller.dart';
import 'package:pos_app/features/employee/e_dashboard/view/e_dashboard.dart';

class EOTPScreen extends StatefulWidget {
  EOTPScreen({super.key});

  @override
  State<EOTPScreen> createState() => _EOTPScreenState();
}

class _EOTPScreenState extends State<EOTPScreen> {
  EmployeeAuthController employeeAuthController = Get.put(EmployeeAuthController());

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
                            width: 45 * (SizeConfig.widthMultiplier ?? 1),
                            height: 70 * (SizeConfig.heightMultiplier ?? 1),
                            child: TextFormField(
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              controller: employeeAuthController.box1,
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
                            width: 45 * (SizeConfig.widthMultiplier ?? 1),
                            height: 70 * (SizeConfig.heightMultiplier ?? 1),
                            child: TextFormField(
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              controller: employeeAuthController.box2,
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
                            width: 45 * (SizeConfig.widthMultiplier ?? 1),
                            height: 70 * (SizeConfig.heightMultiplier ?? 1),
                            child: TextFormField(
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              controller: employeeAuthController.box3,
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
                            width: 45 * (SizeConfig.widthMultiplier ?? 1),
                            height: 70 * (SizeConfig.heightMultiplier ?? 1),
                            child: TextFormField(
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              controller: employeeAuthController.box4,
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
                            width: 45 * (SizeConfig.widthMultiplier ?? 1),
                            height: 70 * (SizeConfig.heightMultiplier ?? 1),
                            child: TextFormField(
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              controller: employeeAuthController.box5,
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
                            width: 45 * (SizeConfig.widthMultiplier ?? 1),
                            height: 70 * (SizeConfig.heightMultiplier ?? 1),
                            child: TextFormField(
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              controller: employeeAuthController.box6,
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
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('VERIFY', style: AppTextStyle.whiteText14W600,), () {employeeAuthController.login();}),

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