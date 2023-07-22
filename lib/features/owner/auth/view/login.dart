import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});


  TextEditingController emailController = TextEditingController();  
  TextEditingController passwordController = TextEditingController();  

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
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
                            width: 2.0,
                          ),
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
                            width: 2.0,
                          ),
                        ),
                      ),
                      
                    ),

                    AppButtonStyle.ElevatedButtonStyled('DARK', Text('Login', style: AppTextStyle.whiteText14W600,), () { })
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}