import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/color_palette.dart';

class EPaymentScreen extends StatefulWidget {
  const EPaymentScreen({super.key});

  @override
  State<EPaymentScreen> createState() => _EPaymentScreenState();
}

class _EPaymentScreenState extends State<EPaymentScreen> {


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