import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/checkout/view/payment_done.dart';


class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key});

  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  @override
  State<CheckoutScreen> createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar Content

      appBar: AppBar(
        title: Text('Checkout', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Id - 4389D', style: AppTextStyle.black40414W600,),
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
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
                  )
                ),
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
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
                  )
                ),
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Text('Order', style: AppTextStyle.black40414W600,),
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(index.toString(), style: AppTextStyle.black40414W400,),
                                    Text('. ', style: AppTextStyle.black40414W400,),
                                    Text('Veg Pizza', style: AppTextStyle.black40414W400,),
                                  ],
                                ),
                                Text('₹ 200', style: AppTextStyle.black40414W400,),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 1,
                    color: lightOrange,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Apply Coupon', style: AppTextStyle.black40412W400,),
                        Text('apply coupon', style: TextStyle(decoration: TextDecoration.underline, color: orange, fontSize: 16, fontWeight: FontWeight.w600,),),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 1,
                    color: lightOrange,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Value', style: AppTextStyle.black40412W400,),
                        Text('₹ 350.00', style: AppTextStyle.black40412W400,),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 1,
                    color: lightOrange,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: AppTextStyle.black40414W600,),
                        Text('₹ 350.00', style: AppTextStyle.black40414W600,),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40 * (SizeConfig.heightMultiplier ?? 1),
                  ),

                  AppButtonStyle.ElevatedButtonStyled('DARK', Text('CONTINUE TO PAYMENT', style: AppTextStyle.whiteText14W600,), () {Get.to(PaymentDoneScreen());})

              ],
            ),
          )
        ),
      ),

    );
  }
}