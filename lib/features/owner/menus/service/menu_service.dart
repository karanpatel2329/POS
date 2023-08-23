import 'package:dio/dio.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/menus/model/addMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuService {
    static Dio dio = Dio();
    // Add new Menu
    static Future addNewMenu(MenuModel addMenu) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(ApiUrl.addMenu, data: addMenu.toJson(),);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

    // Add new Menu

  // Get Menu Data
  static Future getNewMenu() async {
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


    static Future updateMenu(MenuModel addMenu) async {
    // try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      print(ApiUrl.addMenu+(addMenu.id??''));
      print(addMenu.toJson());
      final response = await dio.put("${ApiUrl.addMenu}/${addMenu.id??''}", data: addMenu.toJson(),);
      print(response.data);
      return response;

    // } catch (e) {
    // print(e);
    //   return null;
    // }
  }

    // Update Menu
    static Future deleteMenu(String menuId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.delete('${ApiUrl.addMenu}/$menuId',);
      return response;
    } catch (e) {
      return null;
    }
  }

    static Future addCategory(String name, String ownerId) async {
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Accept'] = 'application/json';
        dio.options.headers['Authorization'] = 'Bearer $token';
        final response = await dio.post(ApiUrl.addCategoru, data: {
          "categoryName":name,
          "createdBy":ownerId
        });
        return response;
      } catch (e) {
        print(e);
        return null;
      }
    }

    static Future getCategory() async {
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Accept'] = 'application/json';
        dio.options.headers['Authorization'] = 'Bearer $token';
        final response = await dio.get(ApiUrl.addCategoru,);
        print(response.data);
        print('==');
        return response;
      } catch (e) {
        print(e);
        return null;
      }
    }



}