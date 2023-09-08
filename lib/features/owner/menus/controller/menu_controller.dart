import 'dart:convert';

import 'package:dio/dio.dart' as res;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/features/owner/menus/model/addMenu.dart';
import 'package:pos_app/features/owner/menus/model/category.dart';
import 'package:pos_app/features/owner/menus/service/menu_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/addMenu.dart';


class MenusController extends GetxController{
  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  RxBool isLoadingAdd = false.obs;
  RxBool isLoadingUpdate = false.obs;
  RxList<MenuModel> menus = <MenuModel>[].obs;
  TextEditingController itemNameControllerEdit = TextEditingController();
  TextEditingController priceControllerEdit = TextEditingController();
  TextEditingController aboutControllerEdit = TextEditingController();
  TextEditingController categoryControllerEdit = TextEditingController();
  Rx<CategoryModel> selectedCategoryModel = CategoryModel().obs;
  // Initial Selected Value
  RxString dropdownvalue = 'Veg'.obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxInt selectedCategories  = 0.obs;
  XFile? image;
  final ImagePicker picker = ImagePicker();

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
      MenuModel menuModel = MenuModel(
        itemName: itemNameController.text,
        itemPrice: double.parse(priceController.text), 
        itemImage: '', 
        itemDes: aboutController.text,
        categoryId: selectedCategoryModel.value.id??"",
        createdBy: prefs.getString('ownerId')??"",
        
      );
      res.Response? response = await MenuService.addNewMenu(menuModel);

    if (response != null) {
        print('object 1');
        isLoadingAdd.value=false;
        menus.add(menuModel);

        Get.back();
        getMenu();
        itemNameController.clear();
        priceController.clear();
        aboutController.clear();
        dropdownvalue.value = 'Veg';
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
      res.Response? response = await MenuService.getNewMenu();
    if (response != null) {
        menus.clear();
        for(var i in response.data){
          menus.add(MenuModelFromJson(jsonEncode(i)));
        }
      }else{
        Get.snackbar("Error 3", "Something went wrong");

      }
    } catch (e) {
      print(e);
      print("Error 4 Something went wrong");
      Get.snackbar("Error 4", "Something went wrong");
    }
  }

  Future updateMenu(MenuModel menu) async {
    try {
      isLoadingUpdate.value = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      MenuModel menuModel = MenuModel(
        itemName: itemNameControllerEdit.text,
        itemPrice: double.parse(priceControllerEdit.text),
        itemImage: menu.itemImage,
        itemDes: aboutControllerEdit.text,
        categoryId:  menu.categoryId,
        createdBy:  prefs.getString('ownerId')??"",
        id: menu.id
      );
      res.Response? response = await MenuService.updateMenu(menuModel);
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

  Future addCategory(String name) async{
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String ownerId  = prefs.getString('ownerId')??"";
      var res =await MenuService.addCategory(name, ownerId);
      if(res!=null){

      }
    }catch(e){

    }
  }

  Future getCategory() async{
    try{

      var res =await MenuService.getCategory();
      if(res!=null){
        categoryList.clear();
        for(var i in res.data){
          categoryList.add(CategoryModel.fromJson(i));
        }
        selectedCategoryModel.value = categoryList.first;
      }
    }catch(e){
      print(e);
    }
  }

    // Upload Media
    Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    image = img;
  }

}