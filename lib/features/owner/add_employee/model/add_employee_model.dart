// To parse this JSON data, do
//
//     final addEmployeeModel = addEmployeeModelFromJson(jsonString);

import 'dart:convert';

AddEmployeeModel addEmployeeModelFromJson(String str) => AddEmployeeModel.fromJson(json.decode(str));

String addEmployeeModelToJson(AddEmployeeModel data) => json.encode(data.toJson());

class AddEmployeeModel {
    String name;
    String email;
    String gender;
    String mobileNo;
    String address;
    String photo;
    String qualification;
    String position;
    String about;
    String ownerId;
    String? id;

    AddEmployeeModel({
        required this.name,
        required this.email,
        required this.gender,
        required this.mobileNo,
        required this.address,
        required this.photo,
        required this.qualification,
        required this.position,
        required this.about,
        required this.ownerId,
        this.id
    });

    factory AddEmployeeModel.fromJson(Map<String, dynamic> json) => AddEmployeeModel(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        mobileNo: json["mobileNo"],
        address: json["address"],
        photo: json["photo"],
        qualification: json["qualification"],
        position: json["position"],
        about: json["about"],
        ownerId: json["ownerId"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "mobileNo": mobileNo,
        "address": address,
        "photo": photo,
        "qualification": qualification,
        "position": position,
        "about": about,
        "ownerId": ownerId,
    };
}
