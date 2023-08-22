import 'package:dio/dio.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/order/model/orderModel.dart';

class OrderService {
  

    // Add new Menu
    static Future newOrder(OrderModel orderModel) async {
    try {
      final dio = Dio();
      final response = await dio.post(ApiUrl.order, data: orderModel.toJson(), options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGUzMjEzMjU0Yjg3MzU2YTIxNWIwNTMiLCJpYXQiOjE2OTI2MzczNDN9.RFDGXmZQc-0G7pyAvn71X7WoNlJUwhNc_9Alwa7IrG0',
        // 'Authorization': 'Bearer ${response.data["token"]} ',
      },
    ));
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
      final dio = Dio();
      final response = await dio.get(ApiUrl.addMenu, options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGUzMjEzMjU0Yjg3MzU2YTIxNWIwNTMiLCJpYXQiOjE2OTI2MzczNDN9.RFDGXmZQc-0G7pyAvn71X7WoNlJUwhNc_9Alwa7IrG0',
        // 'Authorization': 'Bearer ${response.data["token"]} ',
      },
    ));
    print(response.data);
    print(response.statusCode);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

}