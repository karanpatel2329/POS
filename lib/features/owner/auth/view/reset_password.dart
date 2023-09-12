import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/auth/controller/authController.dart';
import 'package:pos_app/features/owner/auth/view/otp_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

AuthController authController = Get.put(AuthController());

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 56, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Image.asset(
                  ImagePath.resetPasswordImage,
                  height: 255,
                  width: 340,
                ),

                SizedBox(
                  height: 40 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Text('Reset Password', style: AppTextStyle.normalText20W700,),

                SizedBox(
                  height: 32 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
        
                      TextFormField(
                        controller: authController.reset_password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter Password',
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
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.visibility_off_outlined,
                              color: orange,
                            ),
                          ),
                        ),
                        
                      ),
        
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        controller: authController.reset_passwordConfirm,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
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
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.visibility_off_outlined,
                              color: orange,
                            ),
                          ),
                        ),
                        
                      ),
        
                      SizedBox(height: 61 * (SizeConfig.heightMultiplier ?? 1),),
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('SUBMIT', style: AppTextStyle.whiteText14W600,), 
                        () {
                          if (authController.reset_password.text == authController.reset_passwordConfirm.text) {
                            authController.resetpassword();
                          }else{
                            Get.snackbar("Error", "Password Is Wrong");
                          }
                         }
                      ),
        
        
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