import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/auth/view/forgot_password.dart';
import 'package:pos_app/features/owner/auth/view/sign_up.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});


  TextEditingController emailController = TextEditingController();  
  TextEditingController passwordController = TextEditingController();  

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
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          labelStyle: AppTextStyle.black40416W400,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: saffron,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder( 
                              borderSide: BorderSide(
                                  width: 1.0, color: saffron), 
                            ),
                        ),
                        
                      ),
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: '*******',
                          labelStyle: AppTextStyle.black40416W400,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: saffron,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder( 
                              borderSide: BorderSide(
                                  width: 1.0, color: saffron), 
                            ),
                        ),
                        
                      ),
        
                      SizedBox(height: 21 * (SizeConfig.heightMultiplier ?? 1),),
        
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){Get.to(ForgotPasswordScreen());},
                          child: Text('Forgot Password?', style: AppTextStyle.saffron14W600,)),
                      ),
        
                      SizedBox(height: 75 * (SizeConfig.heightMultiplier ?? 1),),
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('LOG IN', style: AppTextStyle.whiteText14W600,), () { }),
        
        
                      SizedBox(height: 24 * (SizeConfig.heightMultiplier ?? 1),),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DON\'T HAVE AN ACCOUNT? ', style: AppTextStyle.black40412W400,),
                          InkWell(
                            onTap: (){Get.to(SignUpScreen());},
                            child: Text('CREATE NOW', style: AppTextStyle.saffron14W600,))
                        ],
                      )
        
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