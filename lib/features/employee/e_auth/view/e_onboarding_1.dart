import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_auth/view/e_login.dart';

class EOnboarding extends StatefulWidget {
  const EOnboarding({Key? key}) : super(key: key);

  @override
  State<EOnboarding> createState() => _EOnboardingState();
}

class _EOnboardingState extends State<EOnboarding> {
  @override
  Widget build(BuildContext context) {

    final PageController pageController = PageController();
    RxInt pageIndex = 0.obs;


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      Get.to(ELoginScreen());
                      },
                      child: Text('Skip', style: AppTextStyle.orange14W600))),
              Container(
                margin: const EdgeInsets.only(top: 82),
                height: 450,
                child: PageView(
                    controller: pageController,
                    children: [
      
                      Column(
                        children: [
                          SvgPicture.asset(
                            ImagePath.eOnboarding01,
                            height: 255,
                            width: 340,
                          ),
                          SizedBox(
                            height: 32 * (SizeConfig.heightMultiplier ?? 1),
                          ),
      
                          // const SizedBox(height: 32),
                          Text(
                            'Manage Orders',
                            style: AppTextStyle.poppins20W700,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Use our reliable  order-taking\nsystem, to efficiently record\nand transmit orders to the\nkitchen',
                            style: AppTextStyle.black40414W400,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            ImagePath.eOnboarding02,
                            height: 255,
                            width: 340,
                          ),
                          // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
      
                          const SizedBox(height: 32),
                          Text(
                            'Manage  Customers',
                            style: AppTextStyle.poppins20W700,
                          ),
      
                          const SizedBox(height: 16),
                          Text(
                            'Efficiently manage the\ncustomers, ensuring about the\nmenu items and be able to\nprovide recommendations or\nanswer any questions.',
                            style: AppTextStyle.black40414W400,textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            ImagePath.eOnboarding03,
                            height: 255,
                            width: 340,
                          ),
                          // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
      
                          const SizedBox(height: 32),
                          Text(
                            'Manage Payment',
                            style: AppTextStyle.poppins20W700,
                          ),
      
                          const SizedBox(height: 16),
                          Text(
                            'Our system supports multiple\npayment methods and is up-\nto-date with the latest\ntechnology.',
                            style: AppTextStyle.black40414W400,textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                    onPageChanged: (index) {}),
              ),
              const SizedBox(height: 32),
              AppButtonStyle.ElevatedButtonStyled(
                  'DARK',
                  Text(
                    'Next',
                    style: AppTextStyle.whiteText14W600,
                  ),
                  () {
                    setState(() {
                      pageIndex = pageIndex + 1;
                    });
                    if(pageController.page == 2.0){
                      Get.to(ELoginScreen());
                    }
                    pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.ease);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
