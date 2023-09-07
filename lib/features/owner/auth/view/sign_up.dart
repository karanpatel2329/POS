import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/auth/controller/authController.dart';
import 'package:pos_app/features/owner/auth/view/login.dart';
import 'package:pos_app/features/owner/auth/view/restaurant_details.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
                Text('Create Account', style: AppTextStyle.normalText20W700,),
                SizedBox(
                  height: 32 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: authController.emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Enter Email',
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        
                      ),
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        controller: authController.mobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          labelText: 'Mobile Number',
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                  .hasMatch(value)) {
                            return 'Enter a valid Phone Number!';
                          }
                          return null;
                        },
                        
                      ),
        
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      Obx(() => TextFormField(
                        obscureText: authController.passVisible.value,
                        controller: authController.passwordController,
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
                          suffixIcon: IconButton(
                              onPressed: (){
                                authController.passVisible.value = !authController.passVisible.value;
                              }, 
                              icon: Icon(authController.passVisible.value == true ? Icons.visibility : Icons.visibility_off_outlined))
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid password!';
                          }
                          return null;
                        },
                        
                      ),),
        
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      Obx(() => TextFormField(
                        obscureText: authController.confPassVisible.value,
                        controller: authController.confirmPasswordController,
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
                          suffixIcon: IconButton(
                              onPressed: (){
                                authController.confPassVisible.value = !authController.confPassVisible.value;
                              }, 
                              icon: Icon(authController.confPassVisible.value == true ? Icons.visibility : Icons.visibility_off_outlined))
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            if(authController.passwordController.text != authController.confirmPasswordController.text){
                              return 'Enter a valid password!';
                            }
                          }
                          return null;
                        },
                        
                      ),),
        
                      SizedBox(height: 32 * (SizeConfig.heightMultiplier ?? 1),),
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('CREATE ACCOUNT', style: AppTextStyle.whiteText14W600,), 
                      () {
                        // if(authController.confirmPasswordController.text==authController.passwordController.text){
                        //   Get.to(RestaurantDetailsScreen());
                        // }else{
                        //   Get.snackbar("Error", "Password should match");
                        // }
                        final valid = _formKey.currentState!.validate();
                        if(valid){
                          Get.to(RestaurantDetailsScreen());
                        }else{
                          Get.snackbar("Error", "Password should match");
                        }

                      }),
        
                      SizedBox(height: 8 * (SizeConfig.heightMultiplier ?? 1),),
        
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text('By clicking ', style: AppTextStyle.black40410W400,),
                          Text('Create account ', style: AppTextStyle.black40410W600,),
                          Text('you have agreed to our ', style: AppTextStyle.black40410W400,),
                          Text('Terms of use & Privacy policy', style: AppTextStyle.black40410W600,)
                        ],
                      ),
        
                      SizedBox(height: 37 * (SizeConfig.heightMultiplier ?? 1),),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? ', style: AppTextStyle.black40412W400,),
                          InkWell(
                            onTap: (){Get.to(LoginScreen());},
                            child: Container(
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: orange, width: 1))),
                              child: Text('LOG IN', style: AppTextStyle.orange14W600,)))
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