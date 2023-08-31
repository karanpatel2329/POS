import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_menus/controller/e_menus_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/controller/e_cart_controller.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_confirm_order.dart';

class ETakeOrderScreen extends StatefulWidget {
  const ETakeOrderScreen({super.key});

  @override
  State<ETakeOrderScreen> createState() => _ETakeOrderScreenState();
}

class _ETakeOrderScreenState extends State<ETakeOrderScreen> {

  EMenusController menusController = Get.find<EMenusController>();
  ECartController cartController = Get.put(ECartController());

  // @override
  // Widget build(BuildContext context) {

  //   List<String> categories = ['Veg', 'Non-Veg', 'Beverages'];
  //   String selectedCategories = 'Veg';

  //   return Scaffold(
  //     backgroundColor: white,
  //     appBar: AppBar(
  //       backgroundColor: white,
  //       title: Text('Menu', style: AppTextStyle.black40420W600,),
  //       centerTitle: true,
  //       actions: [
  //         IconButton(
  //         icon: Icon(Icons.shopping_cart_outlined, color: black404, size: 34 * (SizeConfig.heightMultiplier ?? 1),),
  //         onPressed: (){},  
  //       ),
  //       ],
  //     ),
  //     body: SafeArea(
  //       child: SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Categories', style: AppTextStyle.black40412W400,),

  //               SizedBox(
  //                 height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //               ),

  //               SizedBox(
  //                 height: 37 * (SizeConfig.heightMultiplier ?? 1),
  //                 child: ListView.builder(
  //                   scrollDirection: Axis.horizontal,
  //                   shrinkWrap: true,
  //                   itemCount: categories.length,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return Container(
  //                       margin: const EdgeInsets.only(right: 16),
  //                       child: InkWell(
  //                         onTap: (){
  //                           setState(() {
  //                             selectedCategories = categories[index];
  //                           });
  //                         },
  //                         child: Container(
  //                           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(8),
  //                             color: selectedCategories == categories[index] ? orange : white
  //                           ),
  //                           child: Text(categories[index], style: selectedCategories == categories[index] ? AppTextStyle.whiteText14W600 : AppTextStyle.greyText14W600,)
  //                         ),
  //                       ),
  //                     );
  //                   }
  //                 ),
  //               ),

  //               SizedBox(
  //                 height: 16 * (SizeConfig.heightMultiplier ?? 1),
  //               ),

  //               ListView.builder(
  //                 scrollDirection: Axis.vertical,
  //                 shrinkWrap: true,
  //                 itemCount: categories.length,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return Container(
  //                     margin: const EdgeInsets.only(bottom: 16),
                      
  //                     child: InkWell(
                        
  //                       onTap: (){},

  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(8),
  //                           border: Border.all(color: lightOrange)
  //                         ),
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             ClipRRect(
  //                               borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
  //                               child: Image.asset(ImagePath.FoodImage1, height: 110 * (SizeConfig.heightMultiplier ?? 1), width: 152 * (SizeConfig.heightMultiplier ?? 1),),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text('Green Salad', style: AppTextStyle.black40414W400,),
  //                                   SizedBox(
  //                                     height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //                                   ),
  //                                   Text('₹ 250', style: AppTextStyle.black40414W600,),
  //                                   SizedBox(
  //                                     height: 8 * (SizeConfig.heightMultiplier ?? 1),
  //                                   ),
  //                                   Container(
  //                                     padding: const EdgeInsets.all(5),
  //                                     decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(2),
  //                                       border: Border.all(color: lightOrange)
  //                                     ),
  //                                     child: Row(
  //                                       children: [
  //                                         InkWell(
  //                                           onTap: (){}, 
  //                                           child: const Icon(Icons.remove, color: grey, size: 18)
  //                                         ),
  //                                         SizedBox(
  //                                           width: 8 * (SizeConfig.widthMultiplier ?? 1),
  //                                         ),
  //                                         Text('2', style: AppTextStyle.black40412W400,),
  //                                         SizedBox(
  //                                           width: 8 * (SizeConfig.widthMultiplier ?? 1),
  //                                         ),
  //                                         InkWell(
  //                                           onTap: (){}, 
  //                                           child: const Icon(Icons.add, color: grey, size: 18,)
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   )
  //                                 ],
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 }
  //               ),

  //               AppButtonStyle.ElevatedButtonStyled('DARK', Text('SEND TO KITCHEN', style: AppTextStyle.whiteText14W600,), () {Get.to(EConfirmOrderScreen());})

  //             ],
  //           ),
  //         ),
  //       )
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Menu', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: AppTextStyle.black40412W400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                ),
                SizedBox(
                    height: 37 * (SizeConfig.heightMultiplier ?? 1),
                    child: Obx(()=>ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: menusController.categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: InkWell(
                                onTap: () {
                                  menusController.selectedCategories.value = index;
                                  menusController.selectedCategoryModel.value = menusController.categoryList[index];
                                },
                                child: Obx(()=>Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                        menusController.selectedCategories.value == index
                                            ? orange
                                            : white),
                                    child: Text(
                                      menusController.categoryList[index].categoryName??"",
                                      style: menusController.selectedCategories.value == index
                                          ? AppTextStyle.whiteText14W600
                                          : AppTextStyle.greyText14W600,
                                    )),)
                            ),
                          );
                        }),)
                ),
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),
                Obx(() =>ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                  physics: NeverScrollableScrollPhysics(),
                  itemCount: menusController.menus.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(()=>  menusController
                        .menus.value[index].categoryId == menusController.selectedCategoryModel.value.id?
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: lightOrange)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                            child: Image.asset(ImagePath.FoodImage1,fit: BoxFit.cover,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${menusController
                                    .menus.value[index].itemName}', style: AppTextStyle.black40414W400,),
                                SizedBox(
                                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Text('Rs ${menusController
                                    .menus.value[index].itemPrice}', style: AppTextStyle.black40414W600,),
                                SizedBox(
                                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(color: lightOrange)
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: (){
                                            cartController.removeFromCart(menusController
                                                .menus.value[index]);
                                          },
                                          child: const Icon(Icons.remove, color: grey, size: 18)
                                      ),
                                      SizedBox(
                                        width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                      ),
                                      Text(cartController.getItemQuantityById(menusController
                                          .menus.value[index].id).toString(), style: AppTextStyle.black40412W400,),
                                      SizedBox(
                                        width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                      ),
                                      InkWell(
                                          onTap: (){
                                            cartController.addToCart(menusController
                                                .menus.value[index]);
                                          },
                                          child: const Icon(Icons.add, color: grey, size: 18,)
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ):SizedBox());

                  },

                ),),

                // SizedBox(
                //   height: 37 * (SizeConfig.heightMultiplier ?? 1),
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: categories.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         margin: const EdgeInsets.only(right: 16),
                //         child: InkWell(
                //           onTap: (){
                //             setState(() {
                //               selectedCategories = categories[index];
                //             });
                //           },
                //           child: Container(
                //             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(8),
                //               color: selectedCategories == categories[index] ? orange : white
                //             ),
                //             child: Text(categories[index], style: selectedCategories == categories[index] ? AppTextStyle.whiteText14W600 : AppTextStyle.greyText14W600,)
                //           ),
                //         ),
                //       );
                //     }
                //   ),
                // ),

                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                // ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   itemCount: categories.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(
                //       margin: const EdgeInsets.only(bottom: 16),
                //
                //       child: InkWell(
                //
                //         onTap: (){},
                //
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(color: lightOrange)
                //           ),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               ClipRRect(
                //                 borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                //                 child: Image.asset(ImagePath.FoodImage1, height: 110 * (SizeConfig.heightMultiplier ?? 1), width: 152 * (SizeConfig.heightMultiplier ?? 1),),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text('Green Salad', style: AppTextStyle.black40414W400,),
                //                     SizedBox(
                //                       height: 8 * (SizeConfig.heightMultiplier ?? 1),
                //                     ),
                //                     Text('₹ 250', style: AppTextStyle.black40414W600,),
                //                     SizedBox(
                //                       height: 8 * (SizeConfig.heightMultiplier ?? 1),
                //                     ),
                //                     Container(
                //                       padding: const EdgeInsets.all(5),
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(2),
                //                         border: Border.all(color: lightOrange)
                //                       ),
                //                       child: Row(
                //                         children: [
                //                           InkWell(
                //                             onTap: (){},
                //                             child: const Icon(Icons.remove, color: grey, size: 18)
                //                           ),
                //                           SizedBox(
                //                             width: 8 * (SizeConfig.widthMultiplier ?? 1),
                //                           ),
                //                           Text('2', style: AppTextStyle.black40412W400,),
                //                           SizedBox(
                //                             width: 8 * (SizeConfig.widthMultiplier ?? 1),
                //                           ),
                //                           InkWell(
                //                             onTap: (){},
                //                             child: const Icon(Icons.add, color: grey, size: 18,)
                //                           ),
                //                         ],
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     );
                //   }
                // ),

                AppButtonStyle.ElevatedButtonStyled('DARK', Text('SEND TO KITCHEN', style: AppTextStyle.whiteText14W600,), () {
                  cartController.orderTime = DateTime.now();
                  cartController.generateOrderId();
                  Get.to(EConfirmOrderScreen());
                })

              ],
            ),
          ),
        )
      ),
    );
  }
}