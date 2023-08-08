import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

class ReviewsAndRatingsScreen extends StatefulWidget {
  ReviewsAndRatingsScreen({super.key});

  @override
  State<ReviewsAndRatingsScreen> createState() => _ReviewsAndRatingsScreenState();
}

class _ReviewsAndRatingsScreenState extends State<ReviewsAndRatingsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Reviews & Ratings', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [

              Text('All reviews(5434)', style: AppTextStyle.black40416W600,),

              SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

              Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: orange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(ImagePath.FoodImage1, height: 50 * (SizeConfig.heightMultiplier ?? 1), width: 50 * (SizeConfig.widthMultiplier ?? 1), fit: BoxFit.fill,)),
                        SizedBox(
                          width: 15 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arlene McCoy', style: AppTextStyle.black40414W400,),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: orange,),
                                Icon(Icons.star, color: orange,),
                                Icon(Icons.star, color: orange,),
                                Icon(Icons.star, color: orange,),
                                Icon(Icons.star, color: orange,),
                              ],
                            ),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            SizedBox(
                              width: 245 * (SizeConfig.widthMultiplier ?? 1),
                              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', style: AppTextStyle.black40412W400,)),
                          ],
                        ),
                      ],
                    ),
                  );
                  }
                ),
              )
  
            ],
               
             
            
          ),
        ),
      ),
    );
  }
}