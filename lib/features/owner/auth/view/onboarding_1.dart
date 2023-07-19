import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {

    final PageController pageController = PageController();
    int pageIndex = 0;


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    pageController.animateToPage(3, duration: Duration(microseconds: 300), curve: Curves.ease);
                    },
                    child: Text('Skip', style: AppTextStyle.saffron14W600))),
            Container(
              margin: const EdgeInsets.only(top: 82),
              height: 450,
              child: PageView(
                  controller: pageController,
                  children: [

                    Column(
                      children: [
                        Image.asset(
                          ImagePath.welcomeScreenImage,
                          height: 255,
                          width: 340,
                        ),
                        SizedBox(
                          height: 32 * (SizeConfig.heightMultiplier ?? 1),
                        ),

                        // const SizedBox(height: 32),
                        Text(
                          'Grow Your Business',
                          style: AppTextStyle.openSans16W700,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Offer welcoming atmosphere \nto keep customers coming \nback and encourage positive \nword-of-mouth.',
                          style: AppTextStyle.openSans16W700,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          ImagePath.welcomeScreenImage,
                          height: 255,
                          width: 340,
                        ),
                        // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),

                        const SizedBox(height: 32),
                        Text(
                          'Manage Restaurant',
                          style: AppTextStyle.openSans16W700,
                        ),

                        const SizedBox(height: 16),
                        Text(
                          'Develop a marketing strategy\nto create awareness and\nattract customers.',
                          style: AppTextStyle.openSans16W700,textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          ImagePath.welcomeScreenImage,
                          height: 255,
                          width: 340,
                        ),
                        // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),

                        const SizedBox(height: 32),
                        Text(
                          'Manage Employee',
                          style: AppTextStyle.openSans16W700,
                        ),

                        const SizedBox(height: 16),
                        Text(
                          'Foster a positive and inclusive\nwork environment that\npromotes teamwork and\ncollaboration.',
                          style: AppTextStyle.openSans16W700,textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagePath.onboarding_4,
                          height: 255,
                          width: 340,
                        ),
                        // SizedBox(height: 32 * SizeConfig.heightMultiplier!,),
                        const SizedBox(height: 32),
                        AppButtonStyle.ElevatedButtonStyled(
                            'DARK',
                            Text(
                              'Access location',
                              style: AppTextStyle.whiteText14W600,
                            ),
                                () {}),
                        AppButtonStyle.ElevatedButtonStyledUnchecked(
                            'LIGHT',
                            Text(
                              'Skip For Now',
                              style: AppTextStyle.saffron14W600,
                            ),
                                () {})
                      ],
                    ),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  }),
            ),
            const SizedBox(height: 32),
            AppButtonStyle.ElevatedButtonStyled(
                'DARK',
                Text(
                  'Next',
                  style: AppTextStyle.whiteText14W600,
                ),
                () {
                  pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.ease);
            }),
          ],
        ),
      ),
    );
  }
}
