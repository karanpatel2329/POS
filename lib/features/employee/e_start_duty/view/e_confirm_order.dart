import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/core/utlis/timeAgo.dart';
import 'package:pos_app/features/employee/e_menus/model/e_menu_model.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_cart_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_order_controller.dart';

class EConfirmOrderScreen extends StatefulWidget {
  const EConfirmOrderScreen({super.key});

  @override
  State<EConfirmOrderScreen> createState() => _EConfirmOrderScreenState();
}

class _EConfirmOrderScreenState extends State<EConfirmOrderScreen> {

  ECartController cartController = Get.find<ECartController>();
  EOrderController orderController = Get.put(EOrderController());
  Set<EMenuModel> cart = <EMenuModel>{}.obs;

  @override
  void initState() {
    cart.addAll(cartController.items);
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //    return Scaffold(
  //     backgroundColor: white,
  //     appBar: AppBar(
  //       backgroundColor: white,
  //       title: Text('Confirm Order', style: AppTextStyle.black40420W600,),
  //       centerTitle: true,
  //     ),
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                 border: Border.all(width: 2, color: orange),
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 8),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text('Table 1', style: AppTextStyle.black40414W600,),
  //                         Text('3 min ago', style: AppTextStyle.black40412W400,),
  //                       ],
  //                     ),
  //                   ),
                    
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 20),
  //                     child: Text('Order Id- 4389D', style: AppTextStyle.black40412W500,),
  //                   ),

  //                   SizedBox(
  //                     height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //                   ),
        
  //                   ListView.builder(
  //                   scrollDirection: Axis.vertical,
  //                   shrinkWrap: true,
  //                   itemCount: 2,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return Column(
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.symmetric(horizontal: 20),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   Text(index.toString(), style: AppTextStyle.black40414W400,),
  //                                   Text('. ', style: AppTextStyle.black40414W400,),
  //                                   Text('Veg Pizza', style: AppTextStyle.black40414W400,),
  //                                 ],
  //                               ),
  //                               Text('₹ 200', style: AppTextStyle.black40414W400,),
  //                               Container(
  //                                 padding: const EdgeInsets.all(5),
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(2),
  //                                   border: Border.all(color: lightOrange)
  //                                 ),
  //                                 child: Row(
  //                                   children: [
  //                                     InkWell(
  //                                       onTap: (){}, 
  //                                       child: const Icon(Icons.remove, color: grey, size: 18)
  //                                     ),
  //                                     SizedBox(
  //                                       width: 8 * (SizeConfig.widthMultiplier ?? 1),
  //                                     ),
  //                                     Text('2', style: AppTextStyle.black40412W400,),
  //                                     SizedBox(
  //                                       width: 8 * (SizeConfig.widthMultiplier ?? 1),
  //                                     ),
  //                                     InkWell(
  //                                       onTap: (){}, 
  //                                       child: const Icon(Icons.add, color: grey, size: 18,)
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.symmetric(vertical: 8),
  //                           height: 1,
  //                           color: lightOrange,
  //                         ),
  //                       ],
  //                     );
  //                   }
  //                 ),

  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 20),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
  //                         children: [
  //                           Text('Total:', style: AppTextStyle.black40414W600,),
  //                           Text('₹ 400', style: AppTextStyle.black40414W600,),
  //                           Text(''),
  //                         ],
  //                   ),
  //                 ),

  //                 SizedBox(
  //                   height: 12 * (SizeConfig.heightMultiplier ?? 1),
  //                 ),

  //                 AppButtonStyle.ElevatedButtonStyled('DARK', Text('ACCEPT', style: AppTextStyle.whiteText14W600,), () {Get.back();Get.back();Get.back(); Get.to(EStartDutyScreen());})
        
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     )
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Confirm Order',
            style: AppTextStyle.black40420W600,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child:  Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 20, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Table :- ${cartController.table?.tableName}',
                          style: AppTextStyle.black40414W600,
                        ),
                        Text(
                          '${convertToAgo(cartController.orderTime??DateTime.now())}',
                          style: AppTextStyle.black40412W400,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Order Id- ${cartController.orderId.value}',
                      style: AppTextStyle.black40412W500,
                    ),
                  ),
                  SizedBox(
                    height: 8 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  Obx(
                        () => ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${index + 1}',
                                          style:
                                          AppTextStyle.black40414W400,
                                        ),
                                        Text(
                                          '. ',
                                          style:
                                          AppTextStyle.black40414W400,
                                        ),
                                        Text(
                                          '${cart.elementAt(index).itemName}',
                                          style:
                                          AppTextStyle.black40414W400,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '₹ ${cart.elementAt(index).itemPrice}',
                                      style: AppTextStyle.black40414W400,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(2),
                                          border: Border.all(
                                              color: lightOrange)),
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                // cart.remove(cartController.items[index]);
                                                cartController
                                                    .removeFromCart(cart
                                                    .elementAt(index));
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                  Icons.remove,
                                                  color: grey,
                                                  size: 18)),
                                          SizedBox(
                                            width: 8 *
                                                (SizeConfig
                                                    .widthMultiplier ??
                                                    1),
                                          ),
                                          Obx(
                                                () => cartController
                                                .getItemQuantityById(
                                                cart
                                                    .elementAt(
                                                    index)
                                                    .id) !=
                                                0
                                                ? Text(
                                              cartController
                                                  .getItemQuantityById(
                                                  cart
                                                      .elementAt(
                                                      index)
                                                      .id)
                                                  .toString(),
                                              style: AppTextStyle
                                                  .black40412W400,
                                            )
                                                : SizedBox(),
                                          ),
                                          SizedBox(
                                            width: 8 *
                                                (SizeConfig
                                                    .widthMultiplier ??
                                                    1),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                cartController.addToCart(
                                                    cart.elementAt(index));
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: grey,
                                                size: 18,
                                              )),
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
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: AppTextStyle.black40414W600,
                        ),
                        Obx(
                              () => Text(
                            'RS ${cartController.getCartTotal()}',
                            style: AppTextStyle.black40414W600,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  AppButtonStyle.ElevatedButtonStyled(
                      'DARK',
                      Text(
                        'ACCEPT',
                        style: AppTextStyle.whiteText14W600,
                      ),
                          () {
                            orderController.createOrder(cartController.items.value,context);
                      })
                ],
              ),
            )
          ),
        ));
  }
}