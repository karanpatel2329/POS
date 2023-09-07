import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/menus/model/category.dart';
import 'package:pos_app/features/owner/menus/view/menu.dart';
import 'package:pos_app/features/owner/menus/controller/menu_controller.dart';


class AddNewMenuScreen extends StatefulWidget {
  AddNewMenuScreen({super.key});

  @override
  State<AddNewMenuScreen> createState() => AddNewMenuScreenState();
}

class AddNewMenuScreenState extends State<AddNewMenuScreen> {

  MenusController menusController = Get.put(MenusController());
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar Content
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Add New Item', style: AppTextStyle.black40420W600,),
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
                      InkWell(
                        onTap: (){
                          menusController.getImage(ImageSource.camera);
                        },
                        child: Image.asset(ImagePath.restaurantDetails2)
                      ),
            
                    ],
                  ),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  Text('Item detail', style: AppTextStyle.black40414W600,),
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
                    controller: menusController.itemNameController,
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
                    controller: menusController.priceController,
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
                            return 'Enter a valid price!';
                          }
                          return null;
                        },
                  ),
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  TextFormField(
                    controller: menusController.aboutController,
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
            
                  Obx(()=>AppButtonStyle.ElevatedButtonStyled(
                      'DARK', menusController.isLoadingAdd.value?CircularProgressIndicator(color: Colors.white,): Text('Add', style: AppTextStyle.whiteText14W600,),
                          () {
                            final valid = _formKey.currentState!.validate();
                        if(valid && menusController.dropdownvalue.isNotEmpty){
                          menusController.addNewMenu();
                        }else{
                          Get.snackbar("Error", "Please enter all fields");
                        }
                      }))
            
                ],
              ),
            ),
          )
        ),
      ),

    );
  }
}