import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/add_employee/view/employee.dart';

import '../controller/add_employee_controller.dart';

class EditEmployeeAcademicsScreen extends StatefulWidget {
  EditEmployeeAcademicsScreen({super.key});

  @override
  State<EditEmployeeAcademicsScreen> createState() => EeditEmployeeAcademicsScreenState();
}

class EeditEmployeeAcademicsScreenState extends State<EditEmployeeAcademicsScreen> {

  AddEmployeController addEmployeController = Get.put(AddEmployeController()); 

    // Initial Selected Value
  String dropdownvalue = 'Qualification';   
  
  // List of items in our dropdown menu
  var items = [    
    'Qualification',
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
                          backgroundColor: lightGrey,
                          child: Text('1', style: AppTextStyle.orange18W600,),
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
                          backgroundColor: orange,
                          child: Text('2', style: AppTextStyle.whiteText18W600,),
                        ),
                        Text('Academics', style: AppTextStyle.black40412W400,)
                      ],
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
                      Column(
                        children: [

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
                            controller: addEmployeController.serverController,
                            decoration: InputDecoration(
                              hintText: 'Server',
                              labelText: 'Server',
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
                            controller: addEmployeController.aboutController,
                            decoration: InputDecoration(
                              hintText: 'About Employee',
                              labelText: 'About Employee',
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
        
                          AppButtonStyle.ElevatedButtonStyled(
                            'DARK', Text('SUBMIT', style: AppTextStyle.whiteText14W600,), 
                            () {
                              addEmployeController.addNewemployee();
                              Get.back();Get.back(); Get.to(EmployeeScreen());
                            }
                          ),
        
                        ],
                      ),
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