import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/core/utlis/timeAgo.dart';
import 'package:pos_app/features/owner/menus/model/addMenu.dart';
import 'package:pos_app/features/owner/order/controller/cartController.dart';
import 'package:pos_app/features/owner/order/controller/orderController.dart';
import 'package:pos_app/features/owner/order/view/dine_in_screen.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  CartController cartController = Get.find<CartController>();
  OrderController orderController = Get.put(OrderController());
  Set<MenuModel> cart = <MenuModel>{}.obs;
  @override
  void initState() {
    cart.addAll(cartController.items);
    super.initState();
  }

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
