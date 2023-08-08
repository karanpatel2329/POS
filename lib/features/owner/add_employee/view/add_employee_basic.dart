import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/add_employee/view/add_employee_academics.dart';

class AddEmployeeBasicScreen extends StatefulWidget {
  AddEmployeeBasicScreen({super.key});

  @override
  State<AddEmployeeBasicScreen> createState() => _AddEmployeeBasicScreenState();
}

class _AddEmployeeBasicScreenState extends State<AddEmployeeBasicScreen> {

  TextEditingController fullNameController = TextEditingController();  
  TextEditingController emailController = TextEditingController();  
  TextEditingController phoneController = TextEditingController();  
  TextEditingController addressController = TextEditingController();  

    // Initial Selected Value
  String dropdownvalue = 'Gender';   
  
  // List of items in our dropdown menu
  var items = [    
    'Gender',
    'Male',
    'Female',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Add  Employee', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [
                Text('Please fill in the following information', style: AppTextStyle.black40414W400,),

                SizedBox(
                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: orange,
                          child: Text('1', style: AppTextStyle.whiteText18W600,),
                        ),
                        Text('BASIC', style: AppTextStyle.black40412W400,)
                      ],
                    ),
                    SizedBox(
                      width: 32 * (SizeConfig.widthMultiplier ?? 1),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: lightGrey,
                          child: Text('2', style: AppTextStyle.orange18W600,),
                        ),
                        Text('Academics', style: AppTextStyle.black40412W400,)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
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
                        controller: fullNameController,
                        decoration: InputDecoration(
                          hintText: 'Full name',
                          labelText: 'Full name',
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
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
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
                        controller: phoneController,
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
                        ),
                        
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        controller: addressController,
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
        
                      SizedBox(height: 32 * (SizeConfig.heightMultiplier ?? 1),),
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('CONTINUE', style: AppTextStyle.whiteText14W600,), () { Get.to(AddEmployeeAcademicsScreen());}),
        
        
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