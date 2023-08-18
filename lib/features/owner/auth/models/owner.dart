// To parse this JSON data, do
//
//     final owner = ownerFromJson(jsonString);

import 'dart:convert';

Owner ownerFromJson(String str) => Owner.fromJson(json.decode(str));

String ownerToJson(Owner data) => json.encode(data.toJson());

class Owner {
  String name;
  String email;
  String password;
  String legalName;
  String businessType;
  String address;
  String photo;
  String mobileNo;
  String username;
  int userType;

  Owner({
    required this.name,
    required this.email,
    required this.password,
    required this.legalName,
    required this.businessType,
    required this.address,
    required this.photo,
    required this.mobileNo,
    required this.username,
    required this.userType,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    legalName: json["legalName"],
    businessType: json["businessType"],
    address: json["address"],
    photo: json["photo"],
    mobileNo: json["mobileNo"],
    username: json["username"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "legalName": legalName,
    "businessType": businessType,
    "address": address,
    "photo": photo,
    "mobileNo": mobileNo,
    "username": username,
    "userType": userType,
  };
}
