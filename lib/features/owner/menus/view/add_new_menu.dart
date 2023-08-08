import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/menus/view/menu.dart';


class AddNewMenuScreen extends StatefulWidget {
  AddNewMenuScreen({super.key});

  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  @override
  State<AddNewMenuScreen> createState() => AddNewMenuScreenState();
}

class AddNewMenuScreenState extends State<AddNewMenuScreen> {

  @override
  Widget build(BuildContext context) {

      // Initial Selected Value
  String dropdownvalue = 'Veg';

  // List of items in our dropdown menu
  var items = [
    'Veg',
    '4',
    '6',
  ];

    return Scaffold(
      // App Bar Content

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Veg Noodles', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


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
                Text('Veg Noodles', style: AppTextStyle.black40414W600,),
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
                    hint: Text('Select seater'),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
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
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name of the item',
                    labelText: 'Name of the item',
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
                    hintText: 'Price',
                    labelText: 'Price',
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
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'About Food',
                    labelText: 'About Food',
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

                AppButtonStyle.ElevatedButtonStyled('DARK', Text('UPDATE', style: AppTextStyle.whiteText14W600,), () {Get.back();Get.to(MenuScreen());})

              ],
            ),
          )
        ),
      ),

    );
  }
}