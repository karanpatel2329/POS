import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/menus/controller/menu_controller.dart';
import 'package:pos_app/features/owner/order/controller/cartController.dart';
import 'package:pos_app/features/owner/order/controller/orderController.dart';
import 'package:pos_app/features/owner/order/view/confirm_order.dart';

class AddNewItemsScreen extends StatefulWidget {
  const AddNewItemsScreen({super.key, required this.orderId, required this.orderIndex});

  final String orderId;
  final int orderIndex;

  @override
  State<AddNewItemsScreen> createState() => _AddNewItemsScreenState();
}

class _AddNewItemsScreenState extends State<AddNewItemsScreen> {

  OrderController orderController = Get.put(OrderController());
  MenusController menusController = Get.find<MenusController>();
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    menusController.getCategory();
    menusController.getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: Text('Add New Items', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 90),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(orderController.dineInOrderList[widget.orderIndex].tableNumber.toString(), style: AppTextStyle.black40414W600,),
                          Text('${orderController.dineInOrderList[widget.orderIndex].createdAt.timeZoneOffset.inMinutes.toString()} ago', style: AppTextStyle.black40412W400,),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Order Id- ${orderController.dineInOrderList[widget.orderIndex].orderId}', style: AppTextStyle.black40412W500,),
                    ),

                    SizedBox(
                      height: 8 * (SizeConfig.heightMultiplier ?? 1),
                    ),
        
                    ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: orderController.dineInOrderList[widget.orderIndex].items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(index.toString(), style: AppTextStyle.black40414W400,),
                                    Text('. ', style: AppTextStyle.black40414W400,),
                                    Text(orderController.dineInOrderList[widget.orderIndex].items[index].name, style: AppTextStyle.black40414W400,),
                                  ],
                                ),
                                // Text('₹ 200', style: AppTextStyle.black40414W400,),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(color: lightOrange)
                                  ),
                                  child: Row(
                                    children: [
                                      // InkWell(
                                      //   onTap: (){
                                      //     cartController.removeFromCart(menusController.menus.value[index]);
                                      //   }, 
                                      //   child: const Icon(Icons.remove, color: grey, size: 18)
                                      // ),
                                      SizedBox(
                                        width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                      ),
                                      Text(orderController.dineInOrderList[widget.orderIndex].items[index].quantity.toString(), style: AppTextStyle.black40412W400,),
                                      SizedBox(
                                        width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                      ),
                                      // InkWell(
                                      //   onTap: (){
                                      //     cartController.addToCart(menusController.menus.value[index]);
                                      //   }, 
                                      //   child: const Icon(Icons.add, color: grey, size: 18,)
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: 1,
                            color: lightOrange,
                          ),
                        ],
                      );
                    }
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                  //         children: [
                  //           Text('Total:', style: AppTextStyle.black40414W600,),
                  //           Text('₹ 400', style: AppTextStyle.black40414W600,),
                  //           Text(''),
                  //         ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 12 * (SizeConfig.heightMultiplier ?? 1),
                  ),
        
                  ],
                ),
              ),
            
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
            
                  Column(
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
                    ):SizedBox());}))
                  
            
                ],
              ),
            ])
          ),
        ),
      ),),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
        color: white,
        child: AppButtonStyle.ElevatedButtonStyled('DARK', Text('SEND TO KITCHEN', style: AppTextStyle.whiteText14W600,), 
        () {
          // orderController.dineInOrderList[widget.orderIndex].items
        }
        )),

    );
  }
}