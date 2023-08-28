import 'package:dio/dio.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/order/model/orderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {

  static Dio dio = Dio();

    // Add new Menu
    static Future newOrder(var orderModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(ApiUrl.order, data: orderModel,);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

  // Get Menu Data
  static Future getOrder(String ownerId) async {
    print('object11');
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      print(ApiUrl.order+"/ownerId=$ownerId");
      final response = await dio.get(ApiUrl.order+"/?ownerId=$ownerId",);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future updateCookingStatus(String newStatus,String id)async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.put("${ApiUrl.order}/$id", data: {
        'cookingStatus':newStatus
      });
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future updatePaymentStatus(String id)async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.put("${ApiUrl.order}/$id", data: {
        'paymentStatus':'Paid'
      });
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}