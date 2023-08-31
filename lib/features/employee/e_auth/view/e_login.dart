import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_auth/controller/auth_controller.dart';
import 'package:pos_app/features/employee/e_auth/view/e_otp_screen.dart';

class ELoginScreen extends StatelessWidget {
  ELoginScreen({super.key});

  EmployeeAuthController authController = Get.put(EmployeeAuthController());

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        
              children: [
                Text('Log In', style: AppTextStyle.normalText20W700,),
                SizedBox(
                  height: 32 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: EmployeeAuthController.emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter Employee Email',
                          labelText: 'Enter Employee Email',
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
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('LOG IN', style: AppTextStyle.whiteText14W600,), () {Get.offAll(EOTPScreen()); }),
        
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