import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as res;
import 'package:get/get.dart';
import 'package:pos_app/features/owner/order/model/tableModel.dart';
import 'package:pos_app/features/owner/order/service/tableService.dart';

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

  RxList<dynamic> tables = [].obs;

    Future addTable() async {
    try {
      TableModel tableModel = TableModel(
        tableName: tableName.text,
        // seater: int.parse(dropdownvalue.toString()), 
        seater: 2, 
        ownerId: '64e3213254b87356a215b053',
        // id: '', 
        // v: 0,
        
      );
      res.Response? response = await TableService.addNewTable(tableModel);
    if (response != null) {
        print('Table object 1');
        Get.back();
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
        tables.addAll(response.data);// = response.data;
      }else{
        Get.snackbar("Table Error 2", "Something went wrong");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Table Error 3", "Something went wrong");
    }
  }
  
}