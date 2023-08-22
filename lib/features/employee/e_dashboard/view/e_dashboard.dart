import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_menus/view/e_menu.dart';
import 'package:pos_app/features/employee/e_shift_&_payroll/view/e_payroll.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_start_duty.dart';
import 'package:pos_app/features/owner/others/view/about_us.dart';
import 'package:pos_app/features/owner/others/view/help.dart';
import 'package:pos_app/features/owner/others/view/notifications.dart';
import 'package:pos_app/features/owner/others/view/reviews_and_ratings.dart';
import 'package:pos_app/features/owner/others/view/settings.dart';

class EDashboard extends StatefulWidget {
  const EDashboard({super.key});

  @override
  State<EDashboard> createState() => EDashboardState();
}

class EDashboardState extends State<EDashboard> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

      // App Bar Content

      appBar: AppBar(
        backgroundColor: white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: black404, size: 34 * (SizeConfig.heightMultiplier ?? 1),),
          onPressed: (){_key.currentState!.openDrawer();},  
        ),
        title: Text('Dashboard', style: AppTextStyle.black40420W600,),
        centerTitle: true,
        actions: [
          IconButton(
          icon: Icon(Icons.notifications_none, color: black404, size: 34 * (SizeConfig.heightMultiplier ?? 1),),
          onPressed: (){Get.to(NotificationsScreen());},  
        ),
        ],
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning!', style: AppTextStyle.black40416W300,),
                Text('Cody', style: AppTextStyle.black40418W700,),
                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Container(
                  
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: lightOrange),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text('Today so far', style: AppTextStyle.black40414W600,),
                      ),

                      SizedBox(
                        height: 12 * (SizeConfig.heightMultiplier ?? 1),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                      
                            Container(
                      
                              padding: EdgeInsets.all(6),
                              // height: 60 * (SizeConfig.heightMultiplier ?? 1),
                              // width: 145 * (SizeConfig.heightMultiplier ?? 1),
                      
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: orange),
                              ),
                            
                              child: Container(
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(ImagePath.clockIcon),
                      
                                    SizedBox(
                                      width: 6 * (SizeConfig.widthMultiplier ?? 1),
                                    ),
                                    
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Logged In', style: AppTextStyle.black40412W500,),
                                        Text('8.30 am', style: AppTextStyle.orange20W600,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      
                            Container(
                      
                              padding: EdgeInsets.all(6),
                      
                              // height: 60 * (SizeConfig.heightMultiplier ?? 1),
                              // width: 145 * (SizeConfig.heightMultiplier ?? 1),
                      
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: orange),
                              ),
                            
                              child: Container(
                                padding: const EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(ImagePath.orderIcon),
                      
                                    SizedBox(
                                      width: 10 * (SizeConfig.widthMultiplier ?? 1),
                                    ),
                                    
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Orders Taken', style: AppTextStyle.black40412W500,),
                                        Text('4', style: AppTextStyle.orange20W600,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(
                        height: 12 * (SizeConfig.heightMultiplier ?? 1),
                      ),
                      
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('START DUTY', style: AppTextStyle.whiteText14W600,), () {Get.to(EStartDutyScreen());})

                    ],
                  ),
                ),

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

              ],
            ),
          )
        ),
      ),

      // Drawer Content

      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                padding: const EdgeInsets.only(top: 42, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Image.asset(ImagePath.onboarding_4),
                    ),
                    SizedBox(
                      width: 16 * (SizeConfig.widthMultiplier ?? 1),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cody', style: AppTextStyle.black40414W600,),
                        Text('0000048', style: AppTextStyle.black40412W500,),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 16 * (SizeConfig.heightMultiplier ?? 1),
              ),

              Container(
                height: 1,
                color: lightOrange,
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.dashboardIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Dashboard ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.orderIcon,),
                title: Text(' Order ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(EStartDutyScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.menuIcon, height: 24 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Menu ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(EMenuScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.salesIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Payroll ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(EPayrollScreen());
                },
              ),

              Container(
                height: 1,
                color: lightOrange,
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.reviewIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Ratings & Reviews ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(ReviewsAndRatingsScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.settingsIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Settings ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(SettingsScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.helpIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Help ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(HelpScreen());

                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.aboutUsIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' About Us ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(AboutUsScreen());
                },
              ),

                            Container(
                height: 1,
                color: lightOrange,
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.logoutIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Logout ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              
            ],
          ),
        ),
      ), 
    );
  }
}
