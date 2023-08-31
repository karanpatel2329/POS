import 'dart:convert';

EMenuModel eMenuModelFromJson(String str) => EMenuModel.fromJson(json.decode(str));

String eMenuModelToJson(EMenuModel data) => json.encode(data.toJson());

class EMenuModel {
  String itemName;
  double itemPrice;
  String itemImage;
  String itemDes;
  String categoryId;
  String createdBy;
  String? id;

  EMenuModel({
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemDes,
    required this.categoryId,
    required this.createdBy,
    this.id
  });

  factory EMenuModel.fromJson(Map<String, dynamic> json) => EMenuModel(

    itemName: json['itemName'],
    itemImage: json['itemImage'],
    itemPrice: double.tryParse(json['itemPrice'].toString())??0.0,
    itemDes: json['itemDes'],
    categoryId: json['categoryId'],
    createdBy: json['createdBy'],
    id: json['_id']
  );

  Map<String, dynamic> toJson() => {
    'itemName' : itemName,
    'itemImage' : itemImage,
    'itemPrice' : itemPrice,
    'itemDes' : itemDes,
    'categoryId' : categoryId,
    'createdBy' : createdBy,
  };

}