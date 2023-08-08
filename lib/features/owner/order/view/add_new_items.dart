import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/order/view/confirm_order.dart';

class AddNewItemsScreen extends StatefulWidget {
  const AddNewItemsScreen({super.key});

  @override
  State<AddNewItemsScreen> createState() => _AddNewItemsScreenState();
}

class _AddNewItemsScreenState extends State<AddNewItemsScreen> {
  @override
  Widget build(BuildContext context) {

    List<String> categories = ['Veg', 'Non-Veg', 'Beverages'];
    String selectedCategories = 'Veg';

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
                              Text('Table 1', style: AppTextStyle.black40414W600,),
                              Text('3 min ago', style: AppTextStyle.black40412W400,),
                            ],
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text('Order Id- 4389D', style: AppTextStyle.black40412W500,),
                        ),
            
                        SizedBox(
                          height: 8 * (SizeConfig.heightMultiplier ?? 1),
                        ),
                    
                        ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 2,
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
                                        Text('Veg Pizza', style: AppTextStyle.black40414W400,),
                                      ],
                                    ),
                                    Text('₹ 200', style: AppTextStyle.black40414W400,),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(color: lightOrange)
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: (){}, 
                                            child: const Icon(Icons.remove, color: grey, size: 18)
                                          ),
                                          SizedBox(
                                            width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                          ),
                                          Text('2', style: AppTextStyle.black40412W400,),
                                          SizedBox(
                                            width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                          ),
                                          InkWell(
                                            onTap: (){}, 
                                            child: const Icon(Icons.add, color: grey, size: 18,)
                                          ),
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
            
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                              children: [
                                Text('Total:', style: AppTextStyle.black40414W600,),
                                Text('₹ 400', style: AppTextStyle.black40414W600,),
                                Text(''),
                              ],
                        ),
                      ),
            
                      SizedBox(
                        height: 17 * (SizeConfig.heightMultiplier ?? 1),
                      ),
                    
                      ],
                    ),
                  ),
            
                  SizedBox(
                    height: 16 * (SizeConfig.heightMultiplier ?? 1),
                  ),
            
                  Text('Categories', style: AppTextStyle.black40412W400,),
            
                  SizedBox(
                    height: 8 * (SizeConfig.heightMultiplier ?? 1),
                  ),
            
                  // Category Listview
            
                  SizedBox(
                      height: 37 * (SizeConfig.heightMultiplier ?? 1),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  selectedCategories = categories[index];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: selectedCategories == categories[index] ? orange : white
                                ),
                                child: Text(categories[index], style: selectedCategories == categories[index] ? AppTextStyle.whiteText14W600 : AppTextStyle.greyText14W600,)
                              ),
                            ),
                          );
                        }
                      ),
                    ),
            
            
                  SizedBox(
                      height: 16 * (SizeConfig.heightMultiplier ?? 1),
                    ),
            
                  // Items Listview
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: lightOrange)
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                child: Image.asset(ImagePath.FoodImage1, height: 110 * (SizeConfig.heightMultiplier ?? 1), width: 152 * (SizeConfig.heightMultiplier ?? 1),),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Green Salad', style: AppTextStyle.black40414W400,),
                                    SizedBox(
                                      height: 8 * (SizeConfig.heightMultiplier ?? 1),
                                    ),
                                    Text('₹ 250', style: AppTextStyle.black40414W600,),
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
                                            onTap: (){}, 
                                            child: const Icon(Icons.remove, color: grey, size: 18)
                                          ),
                                          SizedBox(
                                            width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                          ),
                                          Text('2', style: AppTextStyle.black40412W400,),
                                          SizedBox(
                                            width: 8 * (SizeConfig.widthMultiplier ?? 1),
                                          ),
                                          InkWell(
                                            onTap: (){}, 
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
                        ),
                      );
                    }
                  ),
                  
            
                ],
              ),
            ),
          ),
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
        color: white,
        child: AppButtonStyle.ElevatedButtonStyled('DARK', Text('SEND TO KITCHEN', style: AppTextStyle.whiteText14W600,), () {Get.to(ConfirmOrderScreen());})),

    );
  }
}