import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/enum.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/auth/controller/authController.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {

  AuthController authController = Get.find<AuthController>();
  
  // List of items in our dropdown menu


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
                        child: Obx(() => authController.imageURL.isEmpty ? Image.asset(ImagePath.restaurantDetails1) : Image.network(authController.imageURL.value, height: 150, width: 100,)),
                      ),
                      InkWell(
                        onTap: (){

                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('Camera', style: AppTextStyle.whiteText18W600,), 
                                        () {
                                          authController.getImage(ImageSource.camera);
                                        }
                                      ),
                                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('Gallery', style: AppTextStyle.whiteText18W600,), 
                                        () {
                                          authController.getImage(ImageSource.gallery);
                                        }
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                        },
                        child: Image.asset(ImagePath.restaurantDetails2)
                      ),

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
                        controller: authController.businessLegalName,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Name!';
                          }
                          return null;
                        },
                        
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
                        child: Obx(()=>DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                          value: authController.dropdownvalue.value,
                          isDense: true,
                          isExpanded: true,
                          underline: const SizedBox(),

                          icon: const Icon(Icons.keyboard_arrow_down, color: orange,),

                          items: authController.items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items, style: AppTextStyle.black40416W400,),
                            );
                          }).toList(),

                          onChanged: (String? newValue) {
                            authController.dropdownvalue.value = newValue!;
                          },
                        )),
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        controller: authController.address,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Address!';
                          }
                          return null;
                        },
                        
                      ),
        
                      SizedBox(height: 115 * (SizeConfig.heightMultiplier ?? 1),),
        
                      Obx(() => AppButtonStyle.ElevatedButtonStyled('DARK', authController.isLoadingAdd.value?CircularProgressIndicator(color: Colors.white,) : Text('SUBMIT', style: AppTextStyle.whiteText14W600,), () {
                        final valid = _formKey.currentState!.validate();
                        if(valid && authController.dropdownvalue.value.isNotEmpty){
                          print(authController.passwordController.text);
                          authController.signUp();
                        }
                      }),),

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