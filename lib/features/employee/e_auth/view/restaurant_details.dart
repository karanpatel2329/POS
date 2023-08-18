import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {

  static TextEditingController businessLegalName = TextEditingController();  
  static TextEditingController address = TextEditingController();  

    // Initial Selected Value
  String dropdownvalue = 'Business Type';   
  
  // List of items in our dropdown menu
  var items = [    
    'Business Type',
    'Restaurant',
    'Bar & Restaurant',
    'Food Truck',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Business Details', style: AppTextStyle.normalText20W700,)),

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 5),
                      child: Image.asset(ImagePath.restaurantDetails1),
                    ),
                    Image.asset(ImagePath.restaurantDetails2),

                  ],
                ),

                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: businessLegalName,
                        decoration: InputDecoration(
                          hintText: 'Business Legal Name',
                          labelText: 'Business Legal Name',
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
                        ),
                        
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),


                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: orange, style: BorderStyle.solid, width: 0.80),
                          ),
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                          value: dropdownvalue,
                          isDense: true,
                          isExpanded: true,
                          underline: const SizedBox(),
                          
                          icon: const Icon(Icons.keyboard_arrow_down, color: orange,),    
                          
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items, style: AppTextStyle.black40416W400,),
                            );
                          }).toList(),

                          onChanged: (String? newValue) { 
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        controller: address,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          labelText: 'Address',
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
                        ),
                        
                      ),
        
                      SizedBox(height: 115 * (SizeConfig.heightMultiplier ?? 1),),
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('SUBMIT', style: AppTextStyle.whiteText14W600,), () { Get.offAll(Dashboard());}),
        
        
                      SizedBox(height: 24 * (SizeConfig.heightMultiplier ?? 1),),
        
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}