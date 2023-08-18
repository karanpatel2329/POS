import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

class EMenuScreen extends StatefulWidget {
  const EMenuScreen({super.key});

  @override
  State<EMenuScreen> createState() => _EMenuScreenState();
}

class _EMenuScreenState extends State<EMenuScreen> {
  @override
  Widget build(BuildContext context) {

    List<String> categories = ['Veg', 'Non-Veg', 'Beverages'];
    String selectedCategories = 'Veg';

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Confirm Order', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories', style: AppTextStyle.black40412W400,),
              SizedBox(
                height: 8 * (SizeConfig.heightMultiplier ?? 1),
              ),
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

              Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: lightOrange),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Image.asset(ImagePath.FoodImage1),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Veg Noodles', style: AppTextStyle.black40414W400,),
                                SizedBox(
                                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('₹ 350', style: AppTextStyle.black40414W600,),
                                  ],
                                )
                              ],
                            ),
                          ),
              
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: lightOrange),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Image.asset(ImagePath.FoodImage1),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Veg Noodles', style: AppTextStyle.black40414W400,),
                                SizedBox(
                                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('₹ 350', style: AppTextStyle.black40414W600,),
                                  ],
                                )
                              ],
                            ),
                          ),
              
                        ],
                      ),
                    ),
                  ],
                
              )

            ],
          ),
        ),
      )
    );
  }
}