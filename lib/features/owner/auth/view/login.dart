import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/auth/controller/authController.dart';
import 'package:pos_app/features/owner/auth/view/forgot_password.dart';
import 'package:pos_app/features/owner/auth/view/sign_up.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log In',
                  style: AppTextStyle.normalText20W700,
                ),
                SizedBox(
                  height: 32 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: authController.loginEmailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            labelStyle: AppTextStyle.black40416W400,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: orange,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0, color: orange),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16 * (SizeConfig.heightMultiplier ?? 1),
                        ),
                        Obx(() => TextFormField(
                          obscureText: authController.passVisible.value,
                          controller: authController.loginPasswordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: AppTextStyle.black40416W400,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: orange,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0, color: orange),
                            ),
                            suffixIcon: IconButton(
                              onPressed: (){
                                authController.passVisible.value = !authController.passVisible.value;
                              }, 
                              icon: Icon(authController.passVisible.value == true ? Icons.visibility : Icons.visibility_off_outlined)))
                          ),
                        ),
                        SizedBox(
                          height: 21 * (SizeConfig.heightMultiplier ?? 1),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                Get.to(ForgotPasswordScreen());
                              },
                              child: Text(
                                'Forgot Password?',
                                style: AppTextStyle.orange14W600,
                              )),
                        ),
                        SizedBox(
                          height: 75 * (SizeConfig.heightMultiplier ?? 1),
                        ),
                        AppButtonStyle.ElevatedButtonStyled(
                            'DARK',
                            Obx(()=>authController.isLoadingLogin.value?CircularProgressIndicator(color: Colors.white,):Text(
                              'LOG IN',
                              style: AppTextStyle.whiteText14W600,
                            )), ()async {
                          await authController.login();
                        }),
                        SizedBox(
                          height: 24 * (SizeConfig.heightMultiplier ?? 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'DON\'T HAVE AN ACCOUNT? ',
                              style: AppTextStyle.black40412W400,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(SignUpScreen());
                                },
                                child: Text(
                                  'CREATE NOW',
                                  style: AppTextStyle.orange14W600,
                                ))
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
