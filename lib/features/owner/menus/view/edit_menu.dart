import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/menus/controller/menu_controller.dart';
import 'package:pos_app/features/owner/menus/model/category.dart';
import 'package:pos_app/features/owner/menus/view/menu.dart';

import '../model/addMenu.dart';


class EditMenuScreen extends StatefulWidget {
  final MenuModel menu;
  final categoryName;
  const EditMenuScreen({super.key, required this.menu, this.categoryName});

  @override
  State<EditMenuScreen> createState() => EditMenuScreenState();
}

class EditMenuScreenState extends State<EditMenuScreen> {

  MenusController menusController = Get.put(MenusController());
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    menusController.itemNameControllerEdit.text = widget.menu.itemName;
    menusController.priceControllerEdit.text = widget.menu.itemPrice.toString();
    menusController.aboutControllerEdit.text = widget.menu.itemDes;
    // menusController.dropdownvalue.value = widget.categoryName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar Content

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(widget.menu.itemName, style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
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
                  Text(widget.menu.itemName, style: AppTextStyle.black40414W600,),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: orange, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Obx(()=>DropdownButton(
                      hint: Text('Select seater'),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                      value: menusController.selectedCategoryModel.value.categoryName,
                      isDense: true,
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: orange,
                      ),
                      items: menusController.categoryList.map((CategoryModel items) {
                        return DropdownMenuItem(
                          value: items.categoryName,
                          child: Text(
                            items.categoryName??'',
                            style: AppTextStyle.black40416W400,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        menusController.selectedCategoryModel.value = menusController.categoryList.value.firstWhere((element) => element.categoryName == (newValue??''));
                      print(menusController.selectedCategoryModel.value.categoryName);
                        },
                    ),)
                  ),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
            
                  TextFormField(
                    controller: menusController.itemNameControllerEdit,
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
                    ),
                    validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Name Of Item!';
                          }
                          return null;
                        },
                  ),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: menusController.priceControllerEdit,
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
                    ),
                    validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Price!';
                          }
                          return null;
                        },
                  ),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  TextFormField(
                    controller: menusController.aboutControllerEdit,
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
                    ),
                    validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid About!';
                          }
                          return null;
                        },
                  ),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
            
                Obx(()=>  AppButtonStyle.ElevatedButtonStyled('DARK',menusController.isLoadingUpdate.value?CircularProgressIndicator(color: Colors.white,):Text('UPDATE', style: AppTextStyle.whiteText14W600,), 
                () {
                  final valid = _formKey.currentState!.validate();

                  if(valid && menusController.dropdownvalue.isNotEmpty){
                    menusController.updateMenu(widget.menu);
                  }else{
                    Get.snackbar("Error", "Please fill Empty fields");
                  }
                })
                )
                ],
              ),
            ),
          )
        ),
      ),

    );
  }
}