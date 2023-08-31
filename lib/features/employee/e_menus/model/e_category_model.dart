// To parse this JSON data, do
//
//     final EcategoryModel = EcategoryModelFromJson(jsonString);

import 'dart:convert';

ECategoryModel eCategoryModelFromJson(String str) => ECategoryModel.fromJson(json.decode(str));

String eCategoryModelToJson(ECategoryModel data) => json.encode(data.toJson());

class ECategoryModel {
  String? id;
  String? categoryName;
  String? createdBy;
  int? v;

  ECategoryModel({
     this.id,
     this.categoryName,
     this.createdBy,
     this.v,
  });

  factory ECategoryModel.fromJson(Map<String, dynamic> json) => ECategoryModel(
    id: json["_id"],
    categoryName: json["categoryName"],
    createdBy: json["createdBy"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "categoryName": categoryName,
    "createdBy": createdBy,
    "__v": v,
  };
}
