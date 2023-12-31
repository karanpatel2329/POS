import 'dart:math';

import 'package:get/get.dart';
import 'package:pos_app/features/owner/menus/controller/menu_controller.dart';
import 'package:pos_app/features/owner/menus/model/addMenu.dart';
import 'package:pos_app/features/owner/order/model/orderModel.dart';
import 'package:pos_app/features/owner/order/model/tableModel.dart';

class CartController extends GetxController {
  RxList<MenuModel> items = <MenuModel>[].obs;
  RxDouble total = 0.0.obs;
  TableModel? table;
  RxString orderId = ''.obs;
  DateTime? orderTime;
  MenusController menuController = Get.put(MenusController());
  void addToCart(MenuModel menu) {
    items.add(menu);
    total.value =total.value +  menu.itemPrice;
    print(items.length);
  }

  void removeFromCart(MenuModel menu) {
    MenuModel cart = items.value.firstWhere((element) => element.id==menu.id);
    if(total.value>0){
      total.value =total.value - menu.itemPrice;
    }
    items.remove(cart);
  }

  int getItemQuantityById(String? menuId) {
   var res = items.value.where((element) => element.id==menuId);

    return res.length;
  }
  
  double getCartTotal() {
   double total = 0.0;
    for (MenuModel m in items.value) {
      total = total + m.itemPrice;
    }
    return total;
  }

  void generateOrderId(){
    final random = Random();
    int order = random.nextInt(900000) + 100000; // Generates a number between 100000 and 999999
    orderId.value = order.toString();
  }

  void addIntoMenuFromOrder(List<Item> itemList){
    items.clear();
    for(Item i in itemList){
      List<MenuModel> r = menuController.menus.where((element) =>element.itemName==i.name).toList();
      if(r.isNotEmpty){
        for(int j=0;j<i.quantity;j++) {
          items.add(r[0]);
        }
      }
    }

  }
}