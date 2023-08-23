import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/api_url.dart';

class DashboardService{
  static Dio dio = Dio();
  // Add new Menu

  static Future getDashboard() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(ApiUrl.dashboard,);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}