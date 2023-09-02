import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';

import '../../order/controller/orderController.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.index});

  final int index;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  OrderController orderController = Get.put(OrderController());

  bool boxValue = false;
  String type = '';

  @override
  Widget build(BuildContext context) {
    
    // RxString gender = 'sv'.obs;
    
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Payment', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
        
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: orange),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Checkbox(
                      checkColor: white,
                      fillColor: MaterialStateColor.resolveWith((states) => orange),
                      value: type == 'UIP' ? boxValue : false,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          boxValue = value!;
                          type = 'UIP';
                          print(boxValue);
                        });
                      },
                    ),
                  ),
                  Text('UPI', style: AppTextStyle.black40416W400,),
                ],
              ),
            ), 
            SizedBox(height: 16 * (SizeConfig.heightMultiplier ?? 1),),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: orange),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Checkbox(
                      checkColor: white,
                      fillColor: MaterialStateColor.resolveWith((states) => orange),
                      value: type == 'Credit/Debit Card' ? boxValue : false,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          boxValue = value!;
                          type = 'Credit/Debit Card';
                          print(boxValue);
                        });
                      },
                    ),
                  ),
                  Text('Credit/Debit Card', style: AppTextStyle.black40416W400,),
                ],
              ),
            ), 
            SizedBox(height: 16 * (SizeConfig.heightMultiplier ?? 1),),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: orange),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Checkbox(
                      checkColor: white,
                      fillColor: MaterialStateColor.resolveWith((states) => orange),
                      value: type == 'Scan & Pay' ? boxValue : false,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          boxValue = value!;
                          type = 'Scan & Pay';
                          print(boxValue);
                        });
                      },
                    ),
                  ),
                  Text('Scan & Pay', style: AppTextStyle.black40416W400,),
                ],
              ),
            ), 
            SizedBox(height: 16 * (SizeConfig.heightMultiplier ?? 1),),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: orange),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Checkbox(
                      checkColor: white,
                      fillColor: MaterialStateColor.resolveWith((states) => orange),
                      value: type == 'Cash' ? boxValue : false,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          boxValue = value!;
                          type = 'Cash';
                          print(boxValue);
                        });
                      },
                    ),
                  ),
                  Text('Cash', style: AppTextStyle.black40416W400,),
                ],
              ),
            ), 
            ],
          ),
        )
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppButtonStyle.ElevatedButtonStyled('Dark', Text('CONTINUE TO PAYMENT', style: AppTextStyle.whiteText18W600,), 
          () {
            orderController.takeAwayOrderList[widget.index].paymentStatus='Paid';
            orderController.updatePaymentStatus( orderController.takeAwayOrderList[widget.index].id);
            setState(() {});
            Get.back();
          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}