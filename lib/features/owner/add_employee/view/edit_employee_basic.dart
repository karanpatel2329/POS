import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/add_employee/controller/add_employee_controller.dart';
import 'package:pos_app/features/owner/add_employee/view/add_employee_academics.dart';
import 'package:pos_app/features/owner/add_employee/view/edit_employee_academics.dart';

import '../model/add_employee_model.dart';

class EditEmployeeBasicScreen extends StatefulWidget {
  EditEmployeeBasicScreen({super.key, required this.addEmployeeModel});
  final AddEmployeeModel addEmployeeModel;


  @override
  State<EditEmployeeBasicScreen> createState() => _EditEmployeeBasicScreenState();
}

class _EditEmployeeBasicScreenState extends State<EditEmployeeBasicScreen> {

  AddEmployeController addEmployeController = Get.put(AddEmployeController());

    // Initial Selected Value
  // String dropdownvalue = 'Gender';   
  
  // // List of items in our dropdown menu
  // var items = [    
  //   'Gender',
  //   'Male',
  //   'Female',
  //   'Other',
  // ];

  @override
  void initState() {
    // TODO: implement initState
    addEmployeController.fullNameController.text = widget.addEmployeeModel.name;
    addEmployeController.emailController.text = widget.addEmployeeModel.email;
    addEmployeController.phoneController.text = widget.addEmployeeModel.mobileNo;
    addEmployeController.addressController.text = widget.addEmployeeModel.address;
    addEmployeController.serverController.text = widget.addEmployeeModel.position;
    addEmployeController.aboutController.text = widget.addEmployeeModel.about;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Edit Employee', style: AppTextStyle.black40420W600,),
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
                        controller: addEmployeController.fullNameController,
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
                      TextFormField(
                        controller: addEmployeController.emailController,
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
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
                        child: Obx(() => DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                          value: addEmployeController.dropdownvalue.value,
                          isDense: true,
                          isExpanded: true,
                          underline: const SizedBox(),
                          
                          icon: const Icon(Icons.keyboard_arrow_down, color: orange,),    
                          
                          items: addEmployeController.items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items, style: AppTextStyle.black40416W400,),
                            );
                          }).toList(),

                          onChanged: (String? newValue) { 
                            addEmployeController.dropdownvalue.value = newValue!;
                          },
                        ),)
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: addEmployeController.phoneController,
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                  .hasMatch(value)) {
                            return 'Enter a valid Phone Number!';
                          }
                          return null;
                        },
                        
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
        
                      TextFormField(
                        controller: addEmployeController.addressController,
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
        
                      SizedBox(height: 32 * (SizeConfig.heightMultiplier ?? 1),),
        
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('CONTINUE', style: AppTextStyle.whiteText14W600,), () { 
                        final valid = _formKey.currentState!.validate();
                        if(valid){
                          Get.to(EditEmployeeAcademicsScreen());
                        }else{
                          Get.snackbar("Error", "Please Fill all Empty Fields!");
                        }
                      }),
        
        
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