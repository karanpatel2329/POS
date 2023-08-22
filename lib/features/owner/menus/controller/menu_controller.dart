import 'package:dio/dio.dart' as res;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/features/owner/menus/service/menu_service.dart';

import '../model/addMenu.dart';

class MenusController extends GetxController{
  Rx<AddMenu>? addMenu;

  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  List<dynamic> menus = [];

  // Initial Selected Value
  RxString dropdownvalue = 'Veg'.obs;

  // List of items in our dropdown menu
  var items = [
    'Veg',
    '4',
    '6',
  ];

  Future addNewMenu() async {
    try {
      AddMenu addMenu = AddMenu(
        itemName: itemNameController.text,
        itemPrice: double.parse(priceController.text), 
        itemImage: '', 
        itemDes: aboutController.text,
        categoryId: '64dc87135ec4757e29ec1309',
        createdBy: '64e3213254b87356a215b053',
        
      );
      res.Response? response = await MenuService.addNewMenu(addMenu);
    if (response != null) {
        print('object 1');
        Get.back();
      }else{
        Get.snackbar("Error 1", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error2", "Something went wrong");
    }
  }

  Future getMenu() async {
    try {
      res.Response? response = await MenuService.getNewMenu();
    if (response != null) {
        print('object 2');
        menus = response.data;
        print(menus);
      }else{
        Get.snackbar("Error 3", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error 4", "Something went wrong");
    }
  }

  // Future updateMenu() async {
  //   try {
  //     AddMenu addMenu = AddMenu(
  //       itemName: itemNameController.text,
  //       itemPrice: double.parse(priceController.text), 
  //       itemImage: '', 
  //       itemDes: aboutController.text,
  //       categoryId: '64dc87135ec4757e29ec1309',
  //       createdBy: '64e3213254b87356a215b053',
        
  //     );
  //     res.Response? response = await MenuService.addNewMenu(addMenu);
  //   if (response != null) {
  //       print('object 3');
  //       Get.back();
  //     }else{
  //       Get.snackbar("Error 4", "Something went wrong");

  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar("Error 5", "Something went wrong");
  //   }
  // }

  Future deleteMenu(String menuId) async {
    try {
      res.Response? response = await MenuService.deleteMenu(menuId);
    if (response != null) {
        print('Menu Deleted');
        // Get.back();
      }else{
        Get.snackbar("Error 4", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error 5", "Something went wrong");
    }
  }

}