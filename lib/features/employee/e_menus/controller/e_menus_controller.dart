import 'dart:convert';

import 'package:dio/dio.dart' as res;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/features/employee/e_menus/model/e_menu_model.dart';
import 'package:pos_app/features/employee/e_menus/service/e_menu_service.dart';
import 'package:pos_app/features/owner/menus/model/category.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EMenusController extends GetxController{
  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  RxBool isLoadingAdd = false.obs;
  RxBool isLoadingUpdate = false.obs;
  RxList<EMenuModel> menus = <EMenuModel>[].obs;
  TextEditingController itemNameControllerEdit = TextEditingController();
  TextEditingController priceControllerEdit = TextEditingController();
  TextEditingController aboutControllerEdit = TextEditingController();
  TextEditingController categoryControllerEdit = TextEditingController();
  Rx<CategoryModel> selectedCategoryModel = CategoryModel().obs;
  // Initial Selected Value
  RxString dropdownvalue = 'Veg'.obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxInt selectedCategories  = 0.obs;

  // List of items in our dropdown menu
  var items = [
    'Veg',
    '4',
    '6',
  ];

  Future addNewMenu() async {
    try {
      isLoadingAdd.value=true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      EMenuModel menuModel = EMenuModel(
        itemName: itemNameController.text,
        itemPrice: double.parse(priceController.text), 
        itemImage: '', 
        itemDes: aboutController.text,
        categoryId: selectedCategoryModel.value.id??"",
        createdBy: prefs.getString('ownerId')??"",
        
      );
      res.Response? response = await EMenuService.addNewMenu(menuModel);

    if (response != null) {
        print('object 1');
        isLoadingAdd.value=false;
        menus.add(menuModel);

        Get.back();
        getMenu();
      }else{
      isLoadingAdd.value=false;
        Get.snackbar("Error 1", "Something went wrong");

      }
    } catch (e) {
      print(e);
      isLoadingAdd.value=false;
      Get.snackbar("Error2", "Something went wrong");
    }
  }

  Future getMenu() async {
    try {
      res.Response? response = await EMenuService.getNewMenu();
    if (response != null) {
        menus.clear();
        print(response.data);
        for(var i in response.data){
          menus.add(eMenuModelFromJson(jsonEncode(i)));
        }
        print(menus);
      }else{
        Get.snackbar("Error 3", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error 4", "Something went wrong");
    }
  }

  Future updateMenu(EMenuModel menu) async {
    try {
      isLoadingUpdate.value = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      EMenuModel menuModel = EMenuModel(
        itemName: itemNameControllerEdit.text,
        itemPrice: double.parse(priceControllerEdit.text),
        itemImage: menu.itemImage,
        itemDes: aboutControllerEdit.text,
        categoryId:  menu.categoryId,
        createdBy:  prefs.getString('ownerId')??"",
        id: menu.id
      );
      res.Response? response = await EMenuService.updateMenu(menuModel);
      await getMenu();
    if (response != null) {
        print('object 3');
        isLoadingUpdate.value = false;
        Get.back();
      }else{
        Get.snackbar("Error 4", "Something went wrong");
        isLoadingUpdate.value = false;
      }
    } catch (e) {
      print(e);
      isLoadingUpdate.value = false;
      Get.snackbar("Error 5", "Something went wrong");
    }
  }

  Future deleteMenu(String menuId) async {
    try {
      menus.remove(menus.value.firstWhere((element) => element.id==menuId));
      res.Response? response = await EMenuService.deleteMenu(menuId);
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

  Future addCategory(String name) async{
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String ownerId  = prefs.getString('ownerId')??"";
      var res =await EMenuService.addCategory(name, ownerId);
      if(res!=null){

      }
    }catch(e){

    }
  }

  Future getCategory() async{
    try{
      print("++++>>>");
      var res =await EMenuService.getCategory();
      if(res!=null){
        categoryList.clear();
        for(var i in res.data){
          print(i);
          categoryList.add(CategoryModel.fromJson(i));
        }
      }
    }catch(e){
print(e);
    }
  }

}