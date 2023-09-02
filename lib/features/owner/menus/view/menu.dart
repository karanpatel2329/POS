import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/owner/menus/controller/menu_controller.dart';
import 'package:pos_app/features/owner/menus/view/add_new_menu.dart';
import 'package:pos_app/features/owner/menus/view/edit_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenusController menusController = Get.find<MenusController>();

  @override
  void initState() {
    // TODO: implement initState
    if(menusController.menus.isEmpty) {
      menusController.getMenu();
      menusController.getCategory();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Menus',
            style: AppTextStyle.black40420W600,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: ()async{
              menusController.getMenu();
              menusController.getCategory();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ListView(
             //  crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 AppButtonStyle.ElevatedButtonStyled(
                     'Dark',
                     Text(
                       'ADD NEW MENU',
                       style: AppTextStyle.whiteText14W600,
                     ), () {
                   Get.to(AddNewMenuScreen());
                 }),
                 SizedBox(
                   height: 24 * (SizeConfig.heightMultiplier ?? 1),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: AppTextStyle.black40412W400,
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Add Category'),
                              content: TextField(
                                controller: menusController.categoryControllerEdit,
                                decoration: InputDecoration(hintText: 'Type category here...'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Submit'),
                                  onPressed: () {
                                    menusController.addCategory(menusController.categoryControllerEdit.text);
                                    // Add your logic for handling the submitted text here
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Add Categories',
                        style: AppTextStyle.orange12W400,
                      ),
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

                 Obx(() =>StaggeredGridView.countBuilder(
                   shrinkWrap: true,

                   physics: NeverScrollableScrollPhysics(),
                   crossAxisCount: 2, // Display 2 containers in each row
                   itemCount: menusController.menus.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Obx(()=>  menusController
                         .menus.value[index].categoryId == menusController.selectedCategoryModel.value.id?Container(
                       margin: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         border: Border.all(width: 1, color: lightOrange),
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Column(
                         children: [
                           Image.asset(
                             ImagePath.FoodImage1,
                           ),
                           Padding(
                             padding: const EdgeInsets.all(15),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   menusController
                                       .menus.value[index].itemName,
                                   style: AppTextStyle.black40414W400,
                                 ),
                                 SizedBox(
                                   height: 8 *
                                       (SizeConfig.heightMultiplier ?? 1),
                                 ),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       '₹ ${menusController.menus.value[index].itemPrice}',
                                       style: AppTextStyle.black40414W600,
                                     ),
                                     Row(
                                       children: [
                                         InkWell(
                                             onTap: () {
                                               Get.to(EditMenuScreen(
                                                 menu: menusController
                                                     .menus
                                                     .value[index],
                                               ));
                                             },
                                             child: Icon(
                                               Icons.edit_outlined,
                                               color: grey,
                                             )),
                                         SizedBox(
                                           width: 8 *
                                               (SizeConfig.widthMultiplier ??
                                                   1),
                                         ),
                                         InkWell(
                                             onTap: () {
                                               menusController.deleteMenu(
                                                   menusController
                                                       .menus
                                                       .value[index]
                                                       .id ??
                                                       "");
                                             },
                                             child: Icon(
                                               Icons.delete,
                                               color: grey,
                                             )),
                                       ],
                                     )
                                   ],
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),
                     ):SizedBox());

                   },
                   staggeredTileBuilder: (int index)=>StaggeredTile.fit(1),
                   //mainAxisSpacing: 4.0,
                   crossAxisSpacing: 8.0,
                 ),)
               ],
              ),
            ),
          ),
        ));
  }
}
