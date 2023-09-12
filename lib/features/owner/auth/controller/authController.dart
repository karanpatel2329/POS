import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/features/owner/auth/models/owner.dart';
import 'package:pos_app/features/owner/auth/service/auth_services.dart';
import 'package:pos_app/features/owner/auth/view/login.dart';
import 'package:pos_app/features/owner/auth/view/otp_screen.dart';
import 'package:pos_app/features/owner/auth/view/reset_password.dart';
import 'package:pos_app/features/owner/dashboard/view/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/api_url.dart';


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
  TextEditingController forgotPasswordController = TextEditingController();
  RxString dropdownvalue = 'Business Type'.obs;
  RxBool isLoadingLogin = false.obs;
  RxBool passVisible = true.obs;
  RxBool confPassVisible = true.obs;
  RxBool isLoadingAdd = false.obs;
  XFile? image;
  final ImagePicker picker = ImagePicker();
  RxString imageURL = ''.obs;

  TextEditingController box1 = TextEditingController();  
  TextEditingController box2 = TextEditingController();  
  TextEditingController box3 = TextEditingController();  
  TextEditingController box4 = TextEditingController();
  TextEditingController box5 = TextEditingController();
  TextEditingController box6 = TextEditingController();
  TextEditingController reset_password = TextEditingController();
  TextEditingController reset_passwordConfirm = TextEditingController();


  var items = [
    'Business Type',
    'Restaurant',
    'Bar & Restaurant',
    'Food Truck',
    'Other',
  ];


  Future signUp() async {
    
      isLoadingAdd.value=true;
      OwnerModel ownerModel = OwnerModel(
          name: businessLegalName.text,
          email: emailController.text,
          password: passwordController.text,
          legalName: businessLegalName.text,
          businessType: dropdownvalue.value,
          address: address.text,
          photo: imageURL.value,
          mobileNo: mobileController.text,
          username: businessLegalName.text,
          userType: 2
        );
        
        var response = await AuthService.signUp(ownerModel);


      if (response != null) {
        isLoadingAdd.value=false;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        print('======================= response.data =======================');
        print(json.decode(response.data));
        print('======================= response.data =======================');
        prefs.setString('token', json.decode(response.data)['data']['token']);
        prefs.setString('ownerId', json.decode(response.data)['data']['_id']);
        Get.to(Dashboard());
      }

  }

  Future login() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoadingLogin.value = true;
      d.Response response = await AuthService.login(
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

  Future forgotPassword() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoadingLogin.value = true;
      d.Response response = await AuthService.forgotPassword(
          email: forgotPasswordController.text,
      );
      isLoadingLogin.value = false;
      if (response != null) {
        Get.to(OTPScreen());
       } else {}
    } catch (e) {
      print(e);
      isLoadingLogin.value = false;
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future verifyOTP() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoadingLogin.value = true;
      d.Response response = await AuthService.verifyOTP(
          email: forgotPasswordController.text,
          otp: int.parse(box1.text + box2.text + box3.text + box4.text + box5.text + box6.text)
      );
      isLoadingLogin.value = false;
      if (response != null) {
        prefs.setString('ownerId', response.data['data']['ownerId']);
        print(response.data['data']['ownerId']);
        Get.to(ResetPasswordScreen());
       } else {}
    } catch (e) {
      print(e);
      isLoadingLogin.value = false;
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future resetpassword() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoadingLogin.value = true;
      d.Response response = await AuthService.resetPassword(
          password: reset_password.text
      );
      isLoadingLogin.value = false;
      if (response != null) {
        Get.to(LoginScreen());
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

      try {
       final SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
          
        var img = await picker.pickImage(source: media);
        image = img;

        print('image!.path');
        print(image!.path);
        print('image!.path');

        d.Dio dio = d.Dio();
        dio.options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGRjODE0YTc0NzhiNjdiYzQ5N2NjMDYiLCJpYXQiOjE2OTQxNTA3OTV9.BtL3ylmQNyA0YiAJphFKxiCWWTnZ9yNjXamtSZCPflQ';
        // dio.options.headers['Authorization'] = 'Bearer $token';

        var formData = d.FormData();

        formData.files.addAll([
        MapEntry(
            'files',
            await d.MultipartFile.fromFile(image!.path , filename: image!.path.split('/').last)),
        ]);

        var response = await dio.post(
          ApiUrl.uploadMedia,
          data: formData,
        );

        imageURL.value = response.data['data'].toString().split('[').last.split(']').first; 

        print('response.data'); 
        print(imageURL);
        print(response.data['data'].toString().split('[').last.split(']').first); 
        print('response.data'); 
      } catch (e) {
        print(e);
      }

  }

}