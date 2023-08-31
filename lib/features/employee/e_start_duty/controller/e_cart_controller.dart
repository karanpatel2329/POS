import 'dart:math';

import 'package:get/get.dart';
import 'package:pos_app/features/employee/e_menus/model/e_menu_model.dart';
import 'package:pos_app/features/employee/e_start_duty/model/e_table_model.dart';

class ECartController extends GetxController {
  RxList<EMenuModel> items = <EMenuModel>[].obs;
  RxDouble total = 0.0.obs;
  ETableModel? table;
  RxString orderId = ''.obs;
  DateTime? orderTime;
  void addToCart(EMenuModel menu) {
    items.add(menu);
    total.value =total.value +  menu.itemPrice;
    print(items.length);
  }

  void removeFromCart(EMenuModel menu) {
    EMenuModel cart = items.value.firstWhere((element) => element.id==menu.id);
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
    for (EMenuModel m in items.value) {
      total = total + m.itemPrice;
    }
    return total;
  }

  void generateOrderId(){
    final random = Random();
    int order = random.nextInt(900000) + 100000; // Generates a number between 100000 and 999999
    orderId.value = order.toString();
  }
}