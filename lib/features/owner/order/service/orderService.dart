import 'package:dio/dio.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/order/model/orderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {

  static Dio dio = Dio();

    // Add new Menu
    static Future newOrder(OrderModel orderModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(ApiUrl.order, data: orderModel.toJson(),);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

  // Get Menu Data
  static Future getNewMenu() async {
    print('object11');
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(ApiUrl.addMenu,);
      return response;
    } catch (e) {
      return null;
    }
  }

}