
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/features/employee/e_menus/model/e_menu_model.dart';
import 'package:pos_app/features/employee/e_start_duty/model/e_order_model.dart';
import 'package:pos_app/features/owner/order/controller/cartController.dart';
import 'package:pos_app/features/owner/order/model/orderModel.dart';
import 'package:pos_app/features/owner/order/service/orderService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../service/e_order_service.dart';
import 'e_cart_controller.dart';

class EOrderController extends GetxController {
  List<dynamic> items = [];
  ECartController cartController = Get.put(ECartController());
  RxList<EOrderModel> dineInOrderList = <EOrderModel>[].obs;
  RxList<EOrderModel> kitchenOpenList = <EOrderModel>[].obs;
  RxList<EOrderModel> kitchenCompletedList = <EOrderModel>[].obs;
  RxList<EOrderModel> takeAwayOrderList = <EOrderModel>[].obs;
  RxBool isTakeaway = false.obs;

  void createOrder(List<EMenuModel> menuModel,context)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var req = {};
    items.clear();
    List id = [];
    for(EMenuModel m in menuModel){
      if(!id.contains(m.id)){
        items.add({"name":m.itemName, "quantity":cartController.getItemQuantityById(m.id)});
        id.add(m.id);
      }
    }
    if(!isTakeaway.value){
      print('object1');
      req = {
        "orderType": "Dine-In",
        "items": items,
        "tableNumber":1,
        "total": cartController.getCartTotal(),
        // "employeeId":"64ddc199de8788bff6bc8cd6",
        "employeeId":prefs.getString('employeeId')??"",
        "ownerId": prefs.getString('ownerId')??"",
        // "orderID":2,
        "orderID":cartController.orderId.value,
      };
    }else{
      req = {
        "orderType": "Takeaway",
        "items": items,
        "takeawayName":1,
        "total": cartController.getCartTotal(),
        // "employeeId":"64ddc199de8788bff6bc8cd6",
        "employeeId":prefs.getString('employeeId')??"",
        "ownerId": prefs.getString('ownerId')??"",
        // "orderID":cartController.orderId.value
        "orderID":2
      };
    }
    print(req);
    var res = await EOrderService.newOrder(req);
    if(res!=null){
      Get.back();Get.back();Get.back();
      // Navigator.popUntil(context,ModalRoute.withName('/EDineInView'));
        // Navigator.(result: DineInScreen());
        // cartController.items.clear();
    }else{
      print(res);
      Get.snackbar("Error","Something went wrong");
    }
    print(res);
  }

  void getOrder()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res=await EOrderService.getOrder(prefs.getString('ownerId')??"");
    if(res!=null){
      for(var i in res.data){
        EOrderModel orderModel = EOrderModel.fromJson(i);
        if(i['orderType']=='Takeaway'){
          takeAwayOrderList.add(EOrderModel.fromJson(i));
          }else{
          dineInOrderList.add(EOrderModel.fromJson(i));
        }
        if(orderModel.cookingStatus=='In Progress' || orderModel.cookingStatus=='Not Started'){
          kitchenOpenList.add(orderModel);
        }
        if(orderModel.cookingStatus=='Completed'){
          kitchenCompletedList.add(orderModel);
        }
      }
    }
    print(res.data);
  }

  void updateCookingStatus(String newStatus, String id)async{
    var res = await OrderService.updateCookingStatus(newStatus, id);
    print("+++++>>>>${res}");
  }
  void updatePaymentStatus( String id)async{
    var res = await OrderService.updatePaymentStatus( id);
    print("+++++>>>>${res}");
  }
}