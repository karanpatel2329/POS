import 'package:dio/dio.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/employee/e_start_duty/model/e_table_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ETableService {
    static Dio dio = Dio();

    // Add new Table
    static Future addNewTable(ETableModel tableModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(ApiUrl.table, data: tableModel.toJson(),);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

    // Get Table
    static Future getTable() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(ApiUrl.table,);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

}