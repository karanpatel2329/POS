import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/checkout/view/checkout.dart';
import 'package:pos_app/features/owner/order/controller/orderController.dart';
import 'package:pos_app/features/owner/order/view/add_new_items.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.orderId, required this.orderIndex});

  final String orderId;
  final int orderIndex;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Order Details', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(orderController.dineInOrderList[widget.orderIndex].tableNumber.toString(), style: AppTextStyle.black40414W600,),
                          Text('${orderController.dineInOrderList[widget.orderIndex].createdAt.timeZoneOffset.inMinutes.toString()} ago', style: AppTextStyle.black40412W400,),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Order Id- ${orderController.dineInOrderList[widget.orderIndex].orderId}', style: AppTextStyle.black40412W500,),
                    ),

                    SizedBox(
                      height: 8 * (SizeConfig.heightMultiplier ?? 1),
                    ),
        
                    ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: orderController.dineInOrderList[widget.orderIndex].items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(index.toString(), style: AppTextStyle.black40414W400,),
                                    Text('. ', style: AppTextStyle.black40414W400,),
                                    Text(orderController.dineInOrderList[widget.orderIndex].items[index].name, style: AppTextStyle.black40414W400,),
                                  ],
                                ),
                                // Text('₹ 200', style: AppTextStyle.black40414W400,),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(color: lightOrange)
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){}, 
                                        child: const Icon(Icons.remove, color: grey, size: 18)
                                      ),
                                      SizedBox(
                                        width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                      ),
                                      Text(orderController.dineInOrderList[widget.orderIndex].items[index].quantity.toString(), style: AppTextStyle.black40412W400,),
                                      SizedBox(
                                        width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                      ),
                                      InkWell(
                                        onTap: (){}, 
                                        child: const Icon(Icons.add, color: grey, size: 18,)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: 1,
                            color: lightOrange,
                          ),
                        ],
                      );
                    }
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                  //         children: [
                  //           Text('Total:', style: AppTextStyle.black40414W600,),
                  //           Text('₹ 400', style: AppTextStyle.black40414W600,),
                  //           Text(''),
                  //         ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 12 * (SizeConfig.heightMultiplier ?? 1),
                  ),

                  AppButtonStyle.ElevatedButtonStyled('DARK', Text('CHECKOUT', style: AppTextStyle.whiteText14W600,), () {Get.to(CheckoutScreen());})
        
                  ],
                ),
              ),
              
              AppButtonStyle.ElevatedButtonStyled('DARK', Text('ADD NEW ITEMS', style: AppTextStyle.whiteText14W600,), () {Get.to(AddNewItemsScreen(orderId: widget.orderId, orderIndex: widget.orderIndex,));})

            ],
          ),
        ),
      )
    );
  }
}