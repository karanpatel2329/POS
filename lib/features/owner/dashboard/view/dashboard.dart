import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/add_employee/view/employee.dart';
import 'package:pos_app/features/owner/auth/view/onboarding_1.dart';
import 'package:pos_app/features/owner/auth/view/welcome_screen.dart';
import 'package:pos_app/features/owner/dashboard/controller/dashboardController.dart';
import 'package:pos_app/features/owner/menus/view/menu.dart';
import 'package:pos_app/features/owner/order/view/dine_in_screen.dart';
import 'package:pos_app/features/owner/others/view/about_us.dart';
import 'package:pos_app/features/owner/others/view/help.dart';
import 'package:pos_app/features/owner/others/view/notifications.dart';
import 'package:pos_app/features/owner/others/view/reviews_and_ratings.dart';
import 'package:pos_app/features/owner/others/view/settings.dart';
import 'package:pos_app/features/owner/sales/view/sales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../menus/controller/menu_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  MenusController menusController = Get.put(MenusController());
  DashboardController dashboardController = Get.put(DashboardController());
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  late List<_ChartData2> data2;
  late TooltipBehavior _tooltip2;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
 
  @override
  void initState() {
    dashboardController.getDashboard();
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];

    data2 = [
      _ChartData2('CHN', 5),
      _ChartData2('GER', 10),
      _ChartData2('RUS', 55),
      _ChartData2('BRZ', 2.4),
      _ChartData2('IND', 28)
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);
    super.initState();
  }

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
            child: Obx(()=>dashboardController.isLoadingDashboard.value?CircularProgressIndicator(color: Colors.white,):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning!', style: AppTextStyle.black40416W300,),
                Text(dashboardController.dashboard?.value.name??"", style: AppTextStyle.black40418W700,),
                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Row(
                  children: [
                    Container(
                      height: 108 * (SizeConfig.heightMultiplier ?? 1),
                      width: 152 * (SizeConfig.heightMultiplier ?? 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: orange
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total revenue', style: AppTextStyle.whiteText14W400,),
                            Obx(()=> Text('₹ ${dashboardController.dashboard?.value.totalRevenue??""}', style: AppTextStyle.whiteText18W600,),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16 * (SizeConfig.widthMultiplier ?? 1),
                    ),
                    Container(
                      height: 108 * (SizeConfig.heightMultiplier ?? 1),
                      width: 152 * (SizeConfig.heightMultiplier ?? 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: orange),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Menu Count', style: AppTextStyle.black40416W400,),
                            Obx(()=>Text('${dashboardController.dashboard?.value.totalMenuCount??""}', style: AppTextStyle.poppins20W700,),)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

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
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text('Total revenue', style: AppTextStyle.black40414W600,),
                      ),

                      SizedBox(
                        height: 12 * (SizeConfig.heightMultiplier ?? 1),
                      ),

                      Row(
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
                              padding: const EdgeInsets.only(left: 6),
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImagePath.orderIcon),

                                  SizedBox(
                                    width: 6 * (SizeConfig.widthMultiplier ?? 1),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Current order', style: AppTextStyle.black40412W500,),
                                      Text('${dashboardController.dashboard?.value.totalCurrentOrders??""}', style: AppTextStyle.orange20W600,),
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
                                    width: 6 * (SizeConfig.widthMultiplier ?? 1),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Order completed', style: AppTextStyle.black40412W500,),
                                      Text('${dashboardController.dashboard?.value.totalCompletedOrders??""}', style: AppTextStyle.orange20W600,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 12 * (SizeConfig.heightMultiplier ?? 1),
                      ),

                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('GO TO NEW ORDER', style: AppTextStyle.whiteText14W600,), () { })

                    ],
                  ),
                ),

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

                // Chart

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: lightOrange),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                            tooltipBehavior: _tooltip,
                            series: <ChartSeries<_ChartData, String>>[
                              ColumnSeries<_ChartData, String>(
                                dataSource: data,
                                xValueMapper: (_ChartData data, _) => data.x,
                                yValueMapper: (_ChartData data, _) => data.y,
                                name: 'Gold',
                                color: orange,
                              )
                            ]
                        ),
                      ),
                      Container(
                        height: 1,
                        color: lightOrange,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                            tooltipBehavior: _tooltip2,
                            series: <ChartSeries<_ChartData2, String>>[
                              ColumnSeries<_ChartData2, String>(
                                  dataSource: data2,
                                  xValueMapper: (_ChartData2 data, _) => data.x,
                                  yValueMapper: (_ChartData2 data, _) => data.y,
                                  name: 'Gold',
                                  color: orange
                              )
                            ]
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),)
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
                        Text('Jane', style: AppTextStyle.black40414W600,),
                        Text('jane@gmail.com', style: AppTextStyle.black40412W500,),
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
                  Get.to(DineInScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.menuIcon, height: 24 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Menu ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(MenuScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.salesIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Sales ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(SalesScreen());
                },
              ),
                    
              ListTile(
                leading: SvgPicture.asset(ImagePath.employeeIcon, height: 20 * (SizeConfig.heightMultiplier ?? 1),),
                title: Text(' Employee ', style: AppTextStyle.black40414W400,),
                onTap: () {
                  Get.to(EmployeeScreen());
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
                onTap: () async{
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.pop(context);
                  Get.to(WelcomeScreen());
                },
              ),
              
            ],
          ),
        ),
      ), 
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}

class _ChartData2 {
  _ChartData2(this.x, this.y);
 
  final String x;
  final double y;
}