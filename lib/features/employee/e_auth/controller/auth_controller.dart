import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/features/employee/e_auth/service/auth_service.dart';
import 'package:pos_app/features/employee/e_dashboard/view/e_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as res;

class EmployeeAuthController extends GetxController {
  
  RxBool isLoadingLogin = false.obs;
  static TextEditingController emailController = TextEditingController();  
  TextEditingController box1 = TextEditingController();  
  TextEditingController box2 = TextEditingController();  
  TextEditingController box3 = TextEditingController();  
  TextEditingController box4 = TextEditingController();  
  TextEditingController box5 = TextEditingController();  
  TextEditingController box6 = TextEditingController();  



  Future login() async {
    try {
      print(int.parse(box1.text+box2.text+box3.text+box4.text+box5.text+box6.text));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoadingLogin.value = true;
      res.Response? response = await EmployeeAuthService.employeeLogin(
        email: emailController.text,
        passcode: int.parse(box1.text+box2.text+box3.text+box4.text+box5.text+box6.text),
      );
      isLoadingLogin.value = false;
      print(response!.data['employee']['token']);
      print('response ==========================');
      if (response != null) {
        // prefs.setString('token', response.data['employee']['token']);
        prefs.setString('token', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGUzMjEzMjU0Yjg3MzU2YTIxNWIwNTMiLCJpYXQiOjE2OTM1NTIwNDV9.PDPJxt3urASzcho9EV6d7tp5LRE02_sqGsh1cNpCxvQ');
        prefs.setString('ownerId', response.data['employee']['ownerId']);
        prefs.setString('employeeId', response.data['employee']['_id']);
        Get.to(EDashboard());
       } else {}
    } catch (e) {
      print(e);
      isLoadingLogin.value = false;
      Get.snackbar("Error", "Something went wrong");
    }
  }

}