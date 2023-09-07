import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/add_employee/controller/add_employee_controller.dart';
import 'package:pos_app/features/owner/add_employee/view/add_employee_basic.dart';
import 'package:pos_app/features/owner/add_employee/view/edit_employee_basic.dart';


class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => EmployeeScreenState();
}

class EmployeeScreenState extends State<EmployeeScreen> {
  AddEmployeController addEmployeController = Get.put(AddEmployeController());

  @override
  void initState() {
    // TODO: implement initState
    if(addEmployeController.employees.isEmpty){
      addEmployeController.getEmployee();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // App Bar Content

     appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Employee', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Obx(() => Text('${addEmployeController.employees.length.toString()} Employees', style: AppTextStyle.black40414W600,),),

                    // SizedBox(
                    //   // width: 150,
                    //   child: AppButtonStyle.ElevatedButtonStyled('Dark', Text('ADD EMPLOYEE', style: AppTextStyle.whiteText14W600,), () {Get.to(AddEmployeeBasicScreen());})
                    // )

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                      ),
                      onPressed: (){Get.to(AddEmployeeBasicScreen());}, 
                      child: Text('ADD EMPLOYEE', style: AppTextStyle.whiteText14W600)
                    ),


                  ],
                ),
        
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Obx(() => ListView.builder(
                  itemCount: addEmployeController.employees.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: lightOrange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(ImagePath.FoodImage1, height: 80 * (SizeConfig.heightMultiplier ?? 1), width: 80 * (SizeConfig.widthMultiplier ?? 1), fit: BoxFit.fill,),
                        SizedBox(
                          width: 24 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(addEmployeController.employees[index].name, style: AppTextStyle.black40414W600,),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            Text(addEmployeController.employees[index].position, style: AppTextStyle.black40414W400,),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(EditEmployeeBasicScreen(addEmployeeModel: addEmployeController.employees[index],));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: orange
                                    ),
                                    child: Icon(Icons.edit, color: white,)
                                  ),
                                ),
                                SizedBox(
                                  width: 10 * (SizeConfig.widthMultiplier ?? 1),
                                ),
                                InkWell(
                                  onTap: (){
                                    addEmployeController.deleteEmployee(addEmployeController.employees[index].id);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: red,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Icon(Icons.delete, color: white,)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                  }
                ),)

              ],
            ),
          )
        ),
      ),

    );
  }
}
