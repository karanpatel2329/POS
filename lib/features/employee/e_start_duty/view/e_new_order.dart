import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_cart_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_table_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/model/e_table_model.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_add_table.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_take_order.dart';

class ENewOrderScreen extends StatefulWidget {
  const ENewOrderScreen({super.key});

  @override
  State<ENewOrderScreen> createState() => _ENewOrderScreenState();
}

class _ENewOrderScreenState extends State<ENewOrderScreen> {

  ETableController tableController = Get.put(ETableController());
  ECartController cartController = Get.put(ECartController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tableController.getTable();

  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: white,
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: Text('New Order', style: AppTextStyle.black40420W600,),
  //     ),

  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
                  
  //                 Text('Select Table', style: AppTextStyle.black40414W600,),
                  
  //                 SizedBox(
  //                   height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //                 ),

  //                 Row(
  //                   children: [
  //                     InkWell(
  //                       onTap: (){Get.to(ETakeOrderScreen());},
  //                       child: Container(
  //                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(8),
  //                           color: lightBlue
  //                         ),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text('TA-1', style: AppTextStyle.normalText18W600,),
  //                             SizedBox(
  //                               height: 4 * (SizeConfig.heightMultiplier ?? 1),
  //                             ),
  //                             Text('4 seater', style: AppTextStyle.normalText12W400,),
  //                           ],
  //                         ),
  //                       ),
  //                     ),

  //                     SizedBox(
  //                       width: 16 * (SizeConfig.widthMultiplier ?? 1),
  //                     ),
  //                     Container(
  //                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(8),
  //                         color: lightBlue
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text('TA-1', style: AppTextStyle.normalText18W600,),
  //                           SizedBox(
  //                             height: 4 * (SizeConfig.heightMultiplier ?? 1),
  //                           ),
  //                           Text('4 seater', style: AppTextStyle.normalText12W400,),
  //                         ],
  //                       ),
  //                     ),

  //                     SizedBox(
  //                       width: 16 * (SizeConfig.widthMultiplier ?? 1),
  //                     ),
  //                     Container(
  //                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(8),
  //                         color: lightBlue
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text('TA-1', style: AppTextStyle.normalText18W600,),
  //                           SizedBox(
  //                             height: 4 * (SizeConfig.heightMultiplier ?? 1),
  //                           ),
  //                           Text('4 seater', style: AppTextStyle.normalText12W400,),
  //                         ],
  //                       ),
  //                     ),

  //                     SizedBox(
  //                       width: 16 * (SizeConfig.widthMultiplier ?? 1),
  //                     ),
  //                     Container(
  //                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(8),
  //                         color: lightBlue
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text('TA-1', style: AppTextStyle.normalText18W600,),
  //                           SizedBox(
  //                             height: 4 * (SizeConfig.heightMultiplier ?? 1),
  //                           ),
  //                           Text('4 seater', style: AppTextStyle.normalText12W400,),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),

  //               ],
  //             ),
  //             AppButtonStyle.ElevatedButtonStyled('LIGHT', Text('ADD NEW TABLE', style: AppTextStyle.orange14W600,), () { Get.to(EAddTableScreen());})
  //           ],
  //         ),
  //       )
  //   ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Order', style: AppTextStyle.black40420W600,),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Select Table', style: AppTextStyle.black40414W600,),
                  
                  SizedBox(
                    height: 8 * (SizeConfig.heightMultiplier ?? 1),
                  ),
                  Obx(()=>Wrap(
                    children:tableController.tables.value.map((item) =>Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          cartController.table =  ETableModel.fromJson(item);
                          Get.to(ETakeOrderScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: lightBlue,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['tableName'],
                                style: AppTextStyle.normalText18W600,
                              ),
                              SizedBox(
                                height: 4 * (SizeConfig.heightMultiplier ?? 1),
                              ),
                              Text(
                                item['seater'].toString(),
                                style: AppTextStyle.normalText12W400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ) ).toList(),
                  ),)

                ],
              ),
              AppButtonStyle.ElevatedButtonStyled('LIGHT', Text('ADD NEW TABLE', style: AppTextStyle.orange14W600,), () { Get.to(EAddTableScreen());})
            ],
          ),
        )
    ),
    );
  }
}