
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/features/owner/menus/model/addMenu.dart';
import 'package:pos_app/features/owner/order/model/orderModel.dart';
import 'package:pos_app/features/owner/order/service/orderService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cartController.dart';

class OrderController extends GetxController {
  List<dynamic> items = [];
  CartController cartController = Get.put(CartController());
  RxList<OrderModel> dineInOrderList = <OrderModel>[].obs;
  RxList<OrderModel> kitchenOpenList = <OrderModel>[].obs;
  RxList<OrderModel> kitchenCompletedList = <OrderModel>[].obs;
  RxList<OrderModel> takeAwayOrderList = <OrderModel>[].obs;
  RxBool isTakeaway = false.obs;

  void createOrder(List<MenuModel> menuModel,context)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var req = {};
    items.clear();
    List id = [];
    for(MenuModel m in menuModel){
      if(!id.contains(m.id)){
        items.add({"name":m.itemName, "quantity":cartController.getItemQuantityById(m.id)});
        id.add(m.id);
      }
    }
    if(!isTakeaway.value){
      req = {
        "orderType": "Dine-In",
        "items": items,
        "tableNumber":1,
        "total": cartController.getCartTotal(),
        //"employeeId":"64ddc199de8788bff6bc8cd6",
        "ownerId": prefs.getString('ownerId')??"",
        "orderID":cartController.orderId.value
      };
    }else{
      req = {
        "orderType": "Takeaway",
        "items": items,
        "takeawayName":1,
        "total": cartController.getCartTotal(),
        //"employeeId":"64ddc199de8788bff6bc8cd6",
        "ownerId": prefs.getString('ownerId')??"",
        "orderID":cartController.orderId.value
      };
    }
    var res = await OrderService.newOrder(req);
    if(res!=null){
      Navigator.popUntil(context,ModalRoute.withName('/DineInScreen'));
        // Navigator.(result: DineInScreen());
        cartController.items.clear();
    }else{
      Get.snackbar("Error","Something went wrong");
    }
    print(res);
  }

  void getOrder()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res=await OrderService.getOrder(prefs.getString('ownerId')??"");
    if(res!=null){
      for(var i in res.data){
        OrderModel orderModel = OrderModel.fromJson(i);
        if(i['orderType']=='Takeaway'){
          takeAwayOrderList.add(OrderModel.fromJson(i));
          }else{
          dineInOrderList.add(OrderModel.fromJson(i));
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