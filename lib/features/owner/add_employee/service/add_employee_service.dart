import 'package:dio/dio.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/add_employee/model/add_employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddEmployeeService {
    
    static Dio dio = Dio();
    
    // Add new Employee
    static Future addNewEmployee(AddEmployeeModel addEmployeeModel) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(ApiUrl.addEmployee, data: addEmployeeModel.toJson(),);
      return response;
    } catch (e) {
    print(e);
      return null;
    }
  }

  // Get Employee Data

  static Future getEmployee() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(ApiUrl.addEmployee,);
      return response;
    } catch (e) {
      return null;
    }
  }


  // Update Imployee
    static Future updateEmployee(AddEmployeeModel addEmployeeModel) async {
    // try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      print(ApiUrl.addEmployee+(addEmployeeModel.id??''));
      print(addEmployeeModel.toJson());
      final response = await dio.put("${ApiUrl.addMenu}/${addEmployeeModel.id??''}", data: addEmployeeModel.toJson(),);
      print(response.data);
      return response;

    // } catch (e) {
    // print(e);
    //   return null;
    // }
  }

    // delete Employee Data

  static Future deleteEmployee(String? employeeID) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.delete('${ApiUrl.addEmployee}/$employeeID',);
      return response;
    } catch (e) {
      return null;
    }
  }


}