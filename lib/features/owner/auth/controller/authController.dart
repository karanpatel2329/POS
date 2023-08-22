import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/features/owner/auth/models/owner.dart';
import 'package:pos_app/features/owner/auth/service/auth_services.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';

class AuthController extends GetxController {
  Rx<Owner>? owner;
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController businessLegalName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  RxString dropdownvalue = 'Business Type'.obs;
  RxBool isLoadingLogin = false.obs;
  var items = [
    'Business Type',
    'Restaurant',
    'Bar & Restaurant',
    'Food Truck',
    'Other',
  ];
  Future signUp() async {
    try {
      Owner owner = Owner(
          name: businessLegalName.text,
          email: emailController.text,
          password: passwordController.text,
          legalName: businessLegalName.text,
          businessType: dropdownvalue.value,
          address: address.text,
          photo: "",
          mobileNo: mobileController.text,
          username: businessLegalName.text,
          userType: 1);
      Response? response = await AuthService.signUp(owner);
      if (response != null) {
        Get.to(Dashboard());
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future login() async {
    try {
      isLoadingLogin.value = true;
      final response = await AuthService.login(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      isLoadingLogin.value = false;
      if (response != null) {
        Get.to(Dashboard());
      } else {}
    } catch (e) {
      print(e);
      isLoadingLogin.value = false;
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
