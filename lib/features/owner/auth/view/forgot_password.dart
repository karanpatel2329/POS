import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/auth/view/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  
  static TextEditingController mobileController = TextEditingController();  

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    margin: const EdgeInsets.only(top: 82),
                    height: 450,
                    child: Column(
                            children: [
                              Image.asset(
                                ImagePath.forgotPasswordImage,
                                height: 255,
                                width: 340,
                              ),
              
                              SizedBox(
                                height: 32 * (SizeConfig.heightMultiplier ?? 1),
                              ),
            
                              Text(
                                'Forgot Password?',
                                style: AppTextStyle.poppins20W700,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Don’t worry ! It happens. Please enter\nthe address associated with your\naccount',
                                style: AppTextStyle.black40414W400,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                  ),
              
                  TextFormField(
                            // controller: ,
                            decoration: InputDecoration(
                              hintText: 'Email/Phone number',
                              labelText: 'Email/Phone number',
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
              
                  SizedBox(height: 52 * (SizeConfig.heightMultiplier ?? 0)),
                  
                  AppButtonStyle.ElevatedButtonStyled(
                      'DARK',
                      Text(
                        'SUBMIT',
                        style: AppTextStyle.whiteText14W600,
                      ),
                      () {Get.to(OTPScreen());}
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
