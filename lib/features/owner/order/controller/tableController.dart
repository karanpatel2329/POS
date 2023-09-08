import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as res;
import 'package:get/get.dart';
import 'package:pos_app/features/owner/order/model/tableModel.dart';
import 'package:pos_app/features/owner/order/service/tableService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TableController extends GetxController {

  TextEditingController tableName = TextEditingController();

    // Initial Selected Value
  RxString dropdownvalue = '2'.obs;

  // List of items in our dropdown menu
  var items = [
    '2',
    '4',
    '6',
  ];

  RxList<TableModel> tables = <TableModel>[].obs;

    Future addTable() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      TableModel tableModel = TableModel(
        tableName: tableName.text,
        // seater: int.parse(dropdownvalue.toString()), 
        seater: int.parse(dropdownvalue.value),
        ownerId: prefs.getString('ownerId')??"",
        // id: '', 
        // v: 0,
        
      );
      res.Response? response = await TableService.addNewTable(tableModel);
    if (response != null) {
        print('Table object 1');
        Get.back();
        tables.add(tableModel);
      }else{
        Get.snackbar("Table Error 1", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Table Error 2", "Something went wrong");
    }
  }

    Future getTable() async {
    try {
      res.Response? response = await TableService.getTable();
    if (response != null) {
        print(response.data);
        tables.addAll((response.data as List).map((e) => TableModel.fromJson(e)));// = response.data;
      }else{
        Get.snackbar("Table Error 2", "Something went wrong");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Table Error 3", "Something went wrong");
    }
  }
  
}