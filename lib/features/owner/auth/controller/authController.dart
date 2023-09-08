import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/features/owner/auth/models/owner.dart';
import 'package:pos_app/features/owner/auth/service/auth_services.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as res;

class AuthController extends GetxController {
  Rx<OwnerModel>? owner;
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
  RxBool passVisible = true.obs;
  RxBool confPassVisible = true.obs;
  RxBool isLoadingAdd = false.obs;
  XFile? image;
  final ImagePicker picker = ImagePicker();


  var items = [
    'Business Type',
    'Restaurant',
    'Bar & Restaurant',
    'Food Truck',
    'Other',
  ];
  Future signUp() async {
    try {
      isLoadingAdd.value=true;
      OwnerModel ownerModel = OwnerModel(
          name: businessLegalName.text,
          email: emailController.text,
          password: passwordController.text,
          legalName: businessLegalName.text,
          businessType: dropdownvalue.value,
          address: address.text,
          photo: "Games",
          mobileNo: mobileController.text,
          username: businessLegalName.text,
          userType: 2);
      res.Response response = await AuthService.signUp(ownerModel);

          print('object ==================================');
          print(response.data);
          print(response.statusCode);
      if (response != null) {
      isLoadingAdd.value=false;
        Get.to(Dashboard());
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future login() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoadingLogin.value = true;
      final response = await AuthService.login(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      isLoadingLogin.value = false;
      if (response != null) {
        prefs.setString('token', response.data['data']['token']);
        prefs.setString('ownerId', response.data['data']['_id']);
        Get.to(Dashboard());
       } else {}
    } catch (e) {
      print(e);
      isLoadingLogin.value = false;
      Get.snackbar("Error", "Something went wrong");
    }
  }

  firstTimeOwner()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTimeOwner', true);

  }

  // Upload Media
    Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    image = img;
  }

}
