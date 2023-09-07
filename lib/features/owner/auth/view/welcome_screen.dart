import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_auth/view/e_login.dart';
import 'package:pos_app/features/employee/e_auth/view/e_onboarding_1.dart';
import 'package:pos_app/features/owner/auth/view/login.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_1.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    goToMain();
    super.initState();
  }
  void goToMain()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? ownerId = prefs.getString('ownerId');
    if(token != null && ownerId != null){
      Get.off(Dashboard());
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.welcomeScreenImage,
                height: 255,
                width: 340,
              ),
              // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
              const SizedBox(height: 32),
              SizedBox(
                height: 45 * (SizeConfig.heightMultiplier ?? 1),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    print(prefs.getBool('firstTimeOwner'));
                    prefs.getBool('firstTimeOwner') == null ? Get.to(Onboarding1()) : Get.to(LoginScreen());
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text("I'm an Owner",style: AppTextStyle.whiteText14W600,),
                ),
              ),
              SizedBox(
                height: 16 * (SizeConfig.heightMultiplier ?? 1),
              ),

              SizedBox(
                height: 45 * (SizeConfig.heightMultiplier ?? 1),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.getBool('firstTimeEmployeee') == null ? Get.to(EOnboarding()) : Get.to(ELoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width, 45 * (SizeConfig.heightMultiplier ?? 1)),
                    backgroundColor: white,
                    elevation: 0,
                    // padding: EdgeInsets.symmetric(
                    //     vertical: 16 * SizeConfig.heightMultiplier!),
                    side: const BorderSide(color: orange),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text("I'm An Employee",style: AppTextStyle.orange14W600,),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
