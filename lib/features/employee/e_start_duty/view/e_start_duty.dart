import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/core/utlis/timeAgo.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_cart_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_order_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_order_details.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_take_order.dart';
import 'e_new_order.dart';

class EStartDutyScreen extends StatefulWidget {
  const EStartDutyScreen({super.key});

  @override
  State<EStartDutyScreen> createState() => _EStartDutyScreenState();
}

class _EStartDutyScreenState extends State<EStartDutyScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: (){Get.back();},
              child: Icon(Icons.arrow_back, color: black,)),
            bottom: TabBar(
              labelColor: orange,
              indicatorColor: orange,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: SvgPicture.asset(ImagePath.dinnerIcon,),
                  text: 'Dine-in',
                ),
                Tab(
                  icon: SvgPicture.asset(ImagePath.takeawayIcon,),
                  text: 'Takeaway',
                ),
                Tab(
                  icon: SvgPicture.asset(ImagePath.kitchenIcon,),
                  text: 'kitchen',
                ),
                Tab(
                  icon: SvgPicture.asset(ImagePath.completedOrderIcon,),
                  text: 'Completed Order',
                ),
              ],
            ), // TabBar
            title: Text('Orders', style: AppTextStyle.black40420W600,),
            centerTitle: true,
            
            backgroundColor: white,
          ), // AppBar
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: EDineInView()
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: ETakeAwayView()
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: EKitchenView()
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: ECompletedOrderView()
              ),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}








// Dine in View
class EDineInView extends StatefulWidget {
  EDineInView ({super.key});

  @override
  State<EDineInView> createState() => _EDineInViewState();
}

class _EDineInViewState extends State<EDineInView> {
  EOrderController orderController = Get.put(EOrderController());

  @override
  void initState() {
    // TODO: implement initState
    if(orderController.dineInOrderList.isEmpty)
    orderController.getOrder();
    super.initState();
  }

//   @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Table Occupied : ', style: AppTextStyle.black40412W400,),
           Obx(()=> Text('${orderController.dineInOrderList.length}', style: AppTextStyle.black40412W600,),)
          ],
        ),
        SizedBox(
          height: 16 * (SizeConfig.heightMultiplier ?? 1),
        ),
        Expanded(
          child: Obx(()=>ListView.builder(
              shrinkWrap: true,
              itemCount: orderController.dineInOrderList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index.isEven == true ? lightPink : white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Table ${orderController.dineInOrderList[index].tableNumber}', style: AppTextStyle.black40414W400,),
                      Text('${convertToAgo(orderController.dineInOrderList[index].createdAt)}', style: AppTextStyle.black40412W400,),
                      InkWell(
                          onTap: (){Get.to(EOrderDetailsScreen());},
                          child: Text('VIEW', style: TextStyle(decoration: TextDecoration.underline, color: orange, fontWeight: FontWeight.w600), )
                      ),
                    ],
                  ),
                );
              }),),
        ),
        SizedBox(
          height: 16 * (SizeConfig.heightMultiplier ?? 1),
        ),
        AppButtonStyle.ElevatedButtonStyled('DARK', Text('NEW ORDER'), () {

          orderController.isTakeaway.value = false;
          Get.to(ENewOrderScreen());})
      ],
    );
  }
}

// Takeaway View
class ETakeAwayView extends StatefulWidget {
  const ETakeAwayView ({super.key});

  @override
  State<ETakeAwayView> createState() => _ETakeAwayViewState();
}

class _ETakeAwayViewState extends State<ETakeAwayView> {

  // ECartController cartController = Get.find<ECartController>();
  ECartController cartController = Get.put(ECartController());
  EOrderController orderController = Get.put(EOrderController());

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Text('Current Order : ', style: AppTextStyle.black40412W400,),
  //           Text('4', style: AppTextStyle.black40412W600,),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 16 * (SizeConfig.heightMultiplier ?? 1),
  //       ),
  //       Expanded(
  //         child: ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: 2,
  //           scrollDirection: Axis.vertical,
  //           itemBuilder: (BuildContext context, index) {
  //           return Container(
  //             margin: const EdgeInsets.only(bottom: 16),
  //             decoration: BoxDecoration(
  //               border: Border.all(width: 1, color: lightOrange),
  //               borderRadius: BorderRadius.circular(8),
  //               color: index.isEven ? brightGrey : lightPink
  //             ),
  //             child: Column(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text('Order 1', style: AppTextStyle.black40414W600,),
  //                           InkWell(
  //                             onTap: (){Get.to(ETakeOrderScreen());},
  //                             child: Icon(Icons.edit)),
  //                         ],
  //                       ),
                        
  //                       Text('3 min ago', style: AppTextStyle.orange12W400,),
  //                       SizedBox(
  //                         height: 4 * (SizeConfig.heightMultiplier ?? 1),
  //                       ),
  //                       Text('Cody', style: AppTextStyle.black40414W400,),
  //                       Text('+91 8918496102', style: AppTextStyle.black40414W400,),
  //                       SizedBox(
  //                         height: 4 * (SizeConfig.heightMultiplier ?? 1),
  //                       ),
  //                       Text('Order Id- 4387D', style: AppTextStyle.black40412W500,),
                  
  //                       ListView.builder(
  //                         scrollDirection: Axis.vertical,
  //                         shrinkWrap: true,
  //                         itemCount: 2,
  //                         itemBuilder: (BuildContext context, int index) {
  //                           return Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 8.0),
  //                                 child: Row(
  //                                   children: [
  //                                     Text(index.toString(), style: AppTextStyle.black40414W400,),
  //                                     Text('. ', style: AppTextStyle.black40414W400,),
  //                                     Text('Veg Pizza', style: AppTextStyle.black40414W400,),
  //                                   ],
  //                                 ),
  //                               ),
  //                               Text('₹ 200', style: AppTextStyle.black40414W400,),
  //                             ],
  //                           );
  //                         }
  //                       ),
  //                       Container(
  //                         margin: EdgeInsets.symmetric(vertical: 8),
  //                         height: 1,
  //                         color: lightOrange,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text('Total :', style: AppTextStyle.black40414W400,),
  //                           Text('₹ 370', style: AppTextStyle.black40414W400,),
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         height: 6 * (SizeConfig.heightMultiplier ?? 1),
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text('Payment:', style: AppTextStyle.black40414W400,),
  //                           Container(
  //                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(8),
  //                               color: red,
  //                             ),
  //                             child: Text('Not Done', style: AppTextStyle.whiteText14W400,),
  //                           )
  //                         ],
  //                       ),
          
  //                     ],
  //                   ),
  //                 ),
                  
  //                 AppButtonStyle.ElevatedButtonStyled('DARK', Text('TAKE PAYMENT', style: AppTextStyle.whiteText14W600,), () {})
  //               ],
  //             ),
  //           );}
  //         ),
  //       ),
  //       SizedBox(
  //         height: 16 * (SizeConfig.heightMultiplier ?? 1),
  //       ),
  //       Align(
  //         alignment: Alignment.bottomCenter,
  //         child: AppButtonStyle.ElevatedButtonStyled('LIGHT', Text('NEW ORDER', style: AppTextStyle.orange14W600,), () {Get.to(ETakeOrderScreen());}))
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child:  Column(
            children: [
              Row(
                children: [
                  Text('Current Order : ', style: AppTextStyle.black40412W400,),
                  Obx(()=> Text('${orderController.takeAwayOrderList.length}', style: AppTextStyle.black40412W600,),)
                ],
              ),
              SizedBox(
                height: 16 * (SizeConfig.heightMultiplier ?? 1),
              ),
              Obx(()=>ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderController.takeAwayOrderList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: lightOrange),
                          borderRadius: BorderRadius.circular(8),
                          color: index.isEven ? brightGrey : lightPink
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Order :-${orderController.takeAwayOrderList[index].takeawayName}', style: AppTextStyle.black40414W600,),
                                    InkWell(
                                        onTap: (){Get.to(ETakeOrderScreen());},
                                        child: Icon(Icons.edit)),
                                  ],
                                ),

                                Text('${convertToAgo(orderController.takeAwayOrderList[index].createdAt)}', style: AppTextStyle.orange12W400,),
                                SizedBox(
                                  height: 4 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Text('${orderController.takeAwayOrderList[index].customer?.name??"Test"}', style: AppTextStyle.black40414W400,),
                                Text('${orderController.takeAwayOrderList[index].customer?.mobileNumber??"Test Mobile"}', style: AppTextStyle.black40414W400,),
                                SizedBox(
                                  height: 4 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Text('Order Id- ${orderController.takeAwayOrderList[index].orderId}', style: AppTextStyle.black40412W500,),

                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: orderController.takeAwayOrderList[index].items.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              children: [
                                                Text(index.toString(), style: AppTextStyle.black40414W400,),
                                                Text('. ', style: AppTextStyle.black40414W400,),
                                                Text('${orderController.takeAwayOrderList[index].items[i].name}', style: AppTextStyle.black40414W400,),
                                              ],
                                            ),
                                          ),
                                          Text('${orderController.takeAwayOrderList[index].items[i].quantity}', style: AppTextStyle.black40414W400,),
                                        ],
                                      );
                                    }
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: 1,
                                  color: lightOrange,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total :', style: AppTextStyle.black40414W400,),
                                    Text('${orderController.takeAwayOrderList[index].total}', style: AppTextStyle.black40414W400,),
                                  ],
                                ),
                                SizedBox(
                                  height: 6 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Payment:', style: AppTextStyle.black40414W400,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: orderController.takeAwayOrderList[index].paymentStatus=='Pending'?red:green,
                                      ),
                                      child: Text('${orderController.takeAwayOrderList[index].paymentStatus}', style: AppTextStyle.whiteText14W400,),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Obx(()=> orderController.takeAwayOrderList[index].paymentStatus=='Pending'?GestureDetector(
                            onTap: (){
                              orderController.takeAwayOrderList[index].paymentStatus='Paid';
                              orderController.updatePaymentStatus( orderController.takeAwayOrderList[index].id);
                              setState(() {

                              });
                            },
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: orange)
                                ),
                                child:Center(child: Text("TAKE PAYMENT",style: AppTextStyle.whiteText14W600.copyWith(color: orange),))
                            ),
                          ):SizedBox(),),

                        ],
                      ),
                    );}
              ),),
              SizedBox(
                height: 16 * (SizeConfig.heightMultiplier ?? 1),
              ),

            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: AppButtonStyle.ElevatedButtonStyled('LIGHT', Text('NEW ORDER', style: AppTextStyle.orange14W600,), () {
              //menusController.menus.clear();
              // orderController.items.clear();
              cartController.items.clear();
              orderController.isTakeaway.value = true;
              Get.to(ETakeOrderScreen());
            }))
      ],
    );
  }
}


// Kitchen View
class EKitchenView extends StatefulWidget {
  const EKitchenView ({super.key});

  @override
  State<EKitchenView> createState() => _EKitchenViewState();
}
class _EKitchenViewState extends State<EKitchenView> {

  RxBool openOrders = true.obs;
  EOrderController orderController = Get.put(EOrderController());

  // @override
  // Widget build(BuildContext context) {
  
  //   RxBool openOrders = true.obs;

  //   return Column(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(width: 1, color: orange),
  //           borderRadius: BorderRadius.circular(8)
  //         ),
  //         child: Row(

  //           children: [
  //             Expanded(
  //               child: InkWell(
  //                 child: Obx(() => Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
  //                     color: openOrders.value == true ? orange : white
  //                   ),
  //                   padding: const EdgeInsets.symmetric(vertical: 10),
  //                   alignment: Alignment.center,
  //                   child: Text('Open', style: openOrders.value == true ? AppTextStyle.whiteText14W600 : AppTextStyle.orange14W600 ,),
  //                 ),),

  //                 onTap: (){
  //                     openOrders.value = true;
  //                 },

  //               ),
  //             ),
  //             Expanded(
  //               child: InkWell(
  //                 child: Obx(() => Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
  //                     color: openOrders.value == false ? orange : white
  //                   ),
  //                   padding: const EdgeInsets.symmetric(vertical: 10),
  //                   alignment: Alignment.center,
  //                   child: Text('Completed', style: openOrders.value == false ? AppTextStyle.whiteText14W600 : AppTextStyle.orange14W600,),
  //                 ),),

  //                 onTap: (){
  //                     openOrders.value = false;
  //                 },

  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: 16 * (SizeConfig.heightMultiplier ?? 1),
  //       ),
        
  //       // Open View

  //       Obx(() => Visibility(
  //         visible: openOrders.value,
  //         child: Expanded(
  //           child: ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: 2,
  //             scrollDirection: Axis.vertical,
  //             itemBuilder: (BuildContext context, index) {
  //             return Container(
  //               margin: const EdgeInsets.only(bottom: 16),
  //               decoration: BoxDecoration(
  //                 border: Border.all(width: 1, color: lightOrange),
  //                 borderRadius: BorderRadius.circular(8),
  //                 color: index.isEven ? brightGrey : lightPink
  //               ),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Order 1', style: AppTextStyle.orange14W600,),
  //                             Text('3 min ago', style: AppTextStyle.orange12W400,),
  //                           ],
  //                         ),
                          
  //                         SizedBox(
  //                           height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //                         ),
        
  //                         Text('Order Id- 4387D', style: AppTextStyle.black40412W500,),
                    
  //                         ListView.builder(
  //                           scrollDirection: Axis.vertical,
  //                           shrinkWrap: true,
  //                           itemCount: 2,
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 8.0),
  //                                   child: Row(
  //                                     children: [
  //                                       Text(index.toString(), style: AppTextStyle.black40414W400,),
  //                                       Text('. ', style: AppTextStyle.black40414W400,),
  //                                       Text('Veg Pizza', style: AppTextStyle.black40414W400,),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Text('₹ 200', style: AppTextStyle.black40414W400,),
  //                               ],
  //                             );
  //                           }
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.symmetric(vertical: 8),
  //                           height: 1,
  //                           color: lightOrange,
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Total :', style: AppTextStyle.black40414W400,),
  //                             Text('₹ 370', style: AppTextStyle.black40414W400,),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: 6 * (SizeConfig.heightMultiplier ?? 1),
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Payment:', style: AppTextStyle.black40414W400,),
  //                             Container(
  //                               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(8),
  //                                 color: green,
  //                               ),
  //                               child: Text('Done', style: AppTextStyle.whiteText14W400,),
  //                             )
  //                           ],
  //                         ),
            
  //                       ],
  //                     ),
  //                   ),
                    
  //                   AppButtonStyle.ElevatedButtonStyled('dark', Text('START COOKING', style: AppTextStyle.whiteText14W600,), () {})
  //                 ],
  //               ),
  //             );}
  //           ),
  //         ),
  //       ),
  //       ),

  //       // Completed View

  //       Obx(
  //         () => Visibility(
  //         visible: !openOrders.value,
  //         child: Expanded(
  //           child: ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: 2,
  //             scrollDirection: Axis.vertical,
  //             itemBuilder: (BuildContext context, index) {
  //             return Container(
  //               margin: const EdgeInsets.only(bottom: 16),
  //               decoration: BoxDecoration(
  //                 border: Border.all(width: 1, color: lightOrange),
  //                 borderRadius: BorderRadius.circular(8),
  //                 color: index.isEven ? brightGrey : lightPink
  //               ),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Order 1', style: AppTextStyle.orange14W600,),
  //                             Text('3 min ago', style: AppTextStyle.orange12W400,),
  //                           ],
  //                         ),
                          
  //                         SizedBox(
  //                           height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //                         ),
        
  //                         Text('Order Id- 4387D', style: AppTextStyle.black40412W500,),
                    
  //                         ListView.builder(
  //                           scrollDirection: Axis.vertical,
  //                           shrinkWrap: true,
  //                           itemCount: 2,
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 8.0),
  //                                   child: Row(
  //                                     children: [
  //                                       Text(index.toString(), style: AppTextStyle.black40414W400,),
  //                                       Text('. ', style: AppTextStyle.black40414W400,),
  //                                       Text('Veg Pizza', style: AppTextStyle.black40414W400,),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Text('₹ 200', style: AppTextStyle.black40414W400,),
  //                               ],
  //                             );
  //                           }
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.symmetric(vertical: 8),
  //                           height: 1,
  //                           color: lightOrange,
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Total :', style: AppTextStyle.black40414W400,),
  //                             Text('₹ 370', style: AppTextStyle.black40414W400,),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: 6 * (SizeConfig.heightMultiplier ?? 1),
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text('Payment:', style: AppTextStyle.black40414W400,),
  //                             Container(
  //                               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(8),
  //                                 color: green,
  //                               ),
  //                               child: Text('Done', style: AppTextStyle.whiteText14W400,),
  //                             )
  //                           ],
  //                         ),
            
  //                       ],
  //                     ),
  //                   ),
                    
  //                   AppButtonStyle.ElevatedButtonStyled('green', Text('START COOKING', style: AppTextStyle.whiteText14W600,), () {})
  //                 ],
  //               ),
  //             );}
  //           ),
  //         ),
  //       ), 
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: orange),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(

            children: [
              Expanded(
                child: InkWell(
                  child: Obx(() => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                      color: openOrders.value == true ? orange : white
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text('Open', style: openOrders.value == true ? AppTextStyle.whiteText14W600 : AppTextStyle.orange14W600 ,),
                  ),),

                  onTap: (){
                      openOrders.value = true;
                  },

                ),
              ),
              Expanded(
                child: InkWell(
                  child: Obx(() => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                      color: openOrders.value == false ? orange : white
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text('Completed', style: openOrders.value == false ? AppTextStyle.whiteText14W600 : AppTextStyle.orange14W600,),
                  ),),

                  onTap: (){
                      openOrders.value = false;
                  },

                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16 * (SizeConfig.heightMultiplier ?? 1),
        ),

        // Open View

        Obx(() => Visibility(
          visible: openOrders.value,
          child: Expanded(
            child: Obx(()=>ListView.builder(
                shrinkWrap: true,
                itemCount: orderController.kitchenOpenList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: lightOrange),
                        borderRadius: BorderRadius.circular(8),
                        color: index.isEven ? brightGrey : lightPink
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${orderController.kitchenOpenList[index].takeawayName==null?'Takeaway No:- ':'Table No:- '} ${orderController.kitchenOpenList[index].takeawayName==null?orderController.kitchenOpenList[index].tableNumber:orderController.kitchenOpenList[index].takeawayName}', style: AppTextStyle.orange14W600,),
                                  Text(convertToAgo(orderController.kitchenOpenList[index].createdAt), style: AppTextStyle.orange12W400,),
                                ],
                              ),

                              SizedBox(
                                height: 8 * (SizeConfig.heightMultiplier ?? 1),
                              ),

                              Text('Order Id- ${orderController.kitchenOpenList[index].orderId}', style: AppTextStyle.black40412W500,),

                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: orderController.kitchenOpenList[index].items.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            children: [
                                              Text('${i+1}', style: AppTextStyle.black40414W400,),
                                              Text('. ', style: AppTextStyle.black40414W400,),
                                              Text('${orderController.kitchenOpenList[index].items[i].name}', style: AppTextStyle.black40414W400,),
                                            ],
                                          ),
                                        ),
                                        Text('${orderController.kitchenOpenList[index].items[i].quantity}', style: AppTextStyle.black40414W400,),
                                      ],
                                    );
                                  }
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                height: 1,
                                color: lightOrange,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total :', style: AppTextStyle.black40414W400,),
                                  Text('Rs ${orderController.kitchenOpenList[index].total}', style: AppTextStyle.black40414W400,),
                                ],
                              ),
                              SizedBox(
                                height: 6 * (SizeConfig.heightMultiplier ?? 1),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Payment:', style: AppTextStyle.black40414W400,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: green,
                                    ),
                                    child: Text('${orderController.kitchenOpenList[index].paymentStatus}', style: AppTextStyle.whiteText14W400,),
                                  )
                                ],
                              ),



                            ],
                          ),
                        ),
                       Obx(()=> orderController.kitchenOpenList[index].paymentStatus=='Pending'?GestureDetector(
                         onTap: (){
                           orderController.kitchenOpenList[index].paymentStatus='Paid';
                           orderController.updatePaymentStatus( orderController.kitchenOpenList[index].id);
                           setState(() {
                           });
                         },
                         child: Container(
                             width: double.infinity,
                             height: 50,
                             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                 border: Border.all(color: orange)
                             ),
                             child:Center(child: Text("TAKE PAYMENT",style: AppTextStyle.whiteText14W600.copyWith(color: orange),))
                         ),
                       ):SizedBox(),),
                        AppButtonStyle.ElevatedButtonStyled('dark', Obx(()=>Text(orderController.kitchenOpenList[index].cookingStatus=='Not Started'?'START COOKING':'COMPLETED', style: AppTextStyle.whiteText14W600,),), () {
                          if(orderController.kitchenOpenList[index].cookingStatus=='Not Started'){
                            orderController.kitchenOpenList[index].cookingStatus='In Progress';
                            orderController.updateCookingStatus('In Progress', orderController.kitchenOpenList[index].id);
                            setState(() {
                            });
                          }
                          if(orderController.kitchenOpenList[index].cookingStatus=='In Progress'){
                            orderController.kitchenOpenList[index].cookingStatus='Completed';
                            orderController.updateCookingStatus('Completed', orderController.kitchenOpenList[index].id);
                            orderController.kitchenOpenList.remove(orderController.kitchenOpenList[index]);
                            orderController.kitchenCompletedList.add(orderController.kitchenOpenList[index]);
                            setState(() {
                            });
                          }

                        })
                      ],
                    ),
                  );}
            ),)
          ),
        ),
        ),

        // Completed View

        Obx(
          () => Visibility(
          visible: !openOrders.value,
          child: Expanded(
            child: Obx(()=>ListView.builder(
                shrinkWrap: true,
                itemCount: orderController.kitchenCompletedList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: lightOrange),
                        borderRadius: BorderRadius.circular(8),
                        color: index.isEven ? brightGrey : lightPink
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${orderController.kitchenCompletedList[index].takeawayName==null?'Takeaway No:- ':'Table No:- '} ${orderController.kitchenCompletedList[index].takeawayName==null?orderController.kitchenCompletedList[index].tableNumber:orderController.kitchenCompletedList[index].takeawayName}', style: AppTextStyle.orange14W600,),
                                  Text('${convertToAgo(orderController.kitchenCompletedList[index].createdAt)}', style: AppTextStyle.orange12W400,),
                                ],
                              ),

                              SizedBox(
                                height: 8 * (SizeConfig.heightMultiplier ?? 1),
                              ),

                              Text('Order Id- ${orderController.kitchenCompletedList[index].orderId}', style: AppTextStyle.black40412W500,),

                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: orderController.kitchenCompletedList[index].items.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int i) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            children: [
                                              Text('${i+1}', style: AppTextStyle.black40414W400,),
                                              Text('. ', style: AppTextStyle.black40414W400,),
                                              Text('${orderController.kitchenCompletedList[index].items[i].name}', style: AppTextStyle.black40414W400,),
                                            ],
                                          ),
                                        ),
                                        Text('${orderController.kitchenCompletedList[index].items[i].quantity}', style: AppTextStyle.black40414W400,),
                                      ],
                                    );
                                  }
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                height: 1,
                                color: lightOrange,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total :', style: AppTextStyle.black40414W400,),
                                  Text('Rs ${orderController.kitchenCompletedList[index].total}', style: AppTextStyle.black40414W400,),
                                ],
                              ),
                              SizedBox(
                                height: 6 * (SizeConfig.heightMultiplier ?? 1),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Payment:', style: AppTextStyle.black40414W400,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: green,
                                    ),
                                    child: Text('${orderController.kitchenCompletedList[index].paymentStatus}', style: AppTextStyle.whiteText14W400,),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),

                        //AppButtonStyle.ElevatedButtonStyled('green', Text('START COOKING', style: AppTextStyle.whiteText14W600,), () {})
                      ],
                    ),
                  );}
            ),)
          ),
        ),
        )
      ],
    );
  }
}

// Completed Order View

class ECompletedOrderView extends StatefulWidget {
  const ECompletedOrderView({super.key});

  static TextEditingController searchController = TextEditingController();

  @override
  State<ECompletedOrderView> createState() => _ECompletedOrderViewState();
}

class _ECompletedOrderViewState extends State<ECompletedOrderView> {
  @override
  Widget build(BuildContext context) {

  // Initial Selected Value
  String dropdownvalue = 'Daily';

  // List of items in our dropdown menu
  var items = [
    'Daily',
    '4',
    '6',
  ];

    return Column(
      children: [
        TextFormField(
          // controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            labelText: 'Search Order',
            labelStyle: AppTextStyle.black40416W400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: lightOrange,
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder( 
                borderSide: BorderSide(
                    width: 1.0, color: lightOrange), 
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                Icons.search,
                color: grey,
              ),
            ),
          ),
          
        ),

        SizedBox(
          height: 11 * (SizeConfig.heightMultiplier ?? 1),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Completed Order : ', style: AppTextStyle.black40412W400,),            
                Text('230', style: AppTextStyle.black40412W600,),            
              ],
            ),

          // DropDown
          Container(
            height: 30,
            alignment: Alignment.center,
            width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: orange, style: BorderStyle.solid, width: 0.80),
                  ),
                  child: DropdownButton(
                    hint: Text('Select seater'),
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    value: dropdownvalue,
                    isDense: true,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: orange,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: AppTextStyle.black40416W400,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),

          ],
        ),
        
        SizedBox(
          height: 8 * (SizeConfig.heightMultiplier ?? 1),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: lightOrange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.checkboxIcon),
                        SizedBox(
                          width: 8 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Table 1’s', style: AppTextStyle.black40414W400,),
                            Text('Closed by Ria', style: AppTextStyle.black40412W400,),
                          ],
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Text('Upi', style: TextStyle(decoration: TextDecoration.underline, color: orange, fontSize: 14, fontWeight: FontWeight.w400),),
                        SizedBox(
                          width: 19 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: green,
                          ),
                          child: Text('₹. 480.00', style: AppTextStyle.whiteText14W400,),
                        ),                  
                      ],
                    ),

                  ],
                ),
              );
          }),
        ),

      ],
    );
  }
}
