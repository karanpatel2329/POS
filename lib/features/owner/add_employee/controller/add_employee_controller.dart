import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as res;
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/features/owner/add_employee/model/add_employee_model.dart';
import 'package:pos_app/features/owner/add_employee/service/add_employee_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddEmployeController extends GetxController {
  
  TextEditingController fullNameController = TextEditingController();  
  TextEditingController emailController = TextEditingController();  
  TextEditingController phoneController = TextEditingController();  
  TextEditingController addressController = TextEditingController();
  TextEditingController serverController = TextEditingController();  
  TextEditingController aboutController = TextEditingController();  
  TextEditingController fullNameControllerEdit = TextEditingController();  
  TextEditingController emailControllerEdit = TextEditingController();  
  TextEditingController phoneControllerEdit = TextEditingController();  
  TextEditingController addressControllerEdit = TextEditingController();
  TextEditingController serverControllerEdit = TextEditingController();  
  TextEditingController aboutControllerEdit = TextEditingController();  
  RxBool isLoadingAdd = false.obs;
  RxBool isLoadingUpdate = false.obs;
  RxList<AddEmployeeModel> employees = <AddEmployeeModel>[].obs;
  XFile? image;
  final ImagePicker picker = ImagePicker();

  RxString dropdownvalue = 'Male'.obs;
  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'Other',
  ];

  Future addNewemployee() async {
    try {
      isLoadingAdd.value=true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      AddEmployeeModel addEmployeeModel = AddEmployeeModel(
        name : fullNameController.text,
        email : emailController.text,
        gender : dropdownvalue.value,
        mobileNo : phoneController.text,
        address : addressController.text,
        photo : '',
        qualification : '',
        position : serverController.text,
        about : aboutController.text,
        ownerId : prefs.getString('ownerId') ?? "",
      );
      res.Response? response = await AddEmployeeService.addNewEmployee(addEmployeeModel);

    if (response != null) {
        print('Sucess');
        isLoadingAdd.value=false;
        employees.add(addEmployeeModel);

        getEmployee();
        fullNameController.clear();
        emailController.clear();
        phoneController.clear();
        addressController.clear();
        serverController.clear();
        aboutController.clear();

      }else{
      isLoadingAdd.value=false;
        Get.snackbar("Error 1", "Something went wrong");

      }
    } catch (e) {
      print(e);
      isLoadingAdd.value=false;
      Get.snackbar("Error2", "Something went wrong");
    }
  } 

  Future getEmployee() async {
    try {
      res.Response? response = await AddEmployeeService.getEmployee();
    if (response != null) {
        employees.clear();
        print(response.data);
        for(var i in response.data){
          employees.add(addEmployeeModelFromJson(jsonEncode(i)));
        }
        print(employees.length);
      }else{
        Get.snackbar("Error 3", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error 4", "Something went wrong");
    }
  }


  //
  Future updateEmployee(AddEmployeeModel addEmployeeModel) async {
    try {
      isLoadingUpdate.value = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      AddEmployeeModel addEmployeeModel = AddEmployeeModel(
        name : fullNameControllerEdit.text,
        email : emailControllerEdit.text,
        gender : "",
        mobileNo : phoneControllerEdit.text,
        address : addressControllerEdit.text,
        photo : "",
        qualification : "",
        position : "",
        about : aboutControllerEdit.text,
        ownerId : prefs.getString('ownerId') ?? "",
      );
      res.Response? response = await AddEmployeeService.updateEmployee(addEmployeeModel);
      await getEmployee();
    if (response != null) {
        print('object 3');
        isLoadingUpdate.value = false;
        Get.back();
      }else{
        Get.snackbar("Error 4", "Something went wrong");
        isLoadingUpdate.value = false;
      }
    } catch (e) {
      print(e);
      isLoadingUpdate.value = false;
      Get.snackbar("Error 5", "Something went wrong");
    }
  }

    Future deleteEmployee(String? employeeId) async {
    try {
      res.Response? response = await AddEmployeeService.deleteEmployee(employeeId);
    if (response != null) {
        print(employees.length);
        Get.snackbar("Deleted","Employee Deleted Successfully");
        getEmployee();
      }else{
        Get.snackbar("Error 3", "Something went wrong");

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error 4", "Something went wrong");
    }
  }

  // Upload Media
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    image = img;
  }

}