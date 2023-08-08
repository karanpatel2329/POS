import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/color_palette.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {


  @override
  Widget build(BuildContext context) {
    
    // RxString gender = 'sv'.obs;
    
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [

          // SizedBox(
          //   height: 50,
          //   child: Obx(() => RadioListTile(
          //     title: Text("Male"),
          //     value: "male", 
          //     groupValue: gender, 
          //     onChanged: (value){
                
          //           gender.value = value.toString();
                
          //     },
          //   ),),
          // ),

          // SizedBox(
          //   height: 50,
          //   child: Obx(() => RadioListTile(
          //     title: Text("Female"),
          //     value: "female", 
          //     groupValue: gender, 
          //     onChanged: (value){
          //       setState(() {
          //         gender.value = value.toString();
          //       });
          //     },
          //   ),),
          // )
          ],
        )
      ),
    );
  }
}