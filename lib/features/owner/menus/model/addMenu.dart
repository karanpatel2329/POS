import 'dart:convert';

AddMenu addMenuFromJson(String str) => AddMenu.fromJson(json.decode(str));

String addMenuToJson(AddMenu data) => json.encode(data.toJson());

class AddMenu {
  String itemName;
  double itemPrice;
  String itemImage;
  String itemDes;
  String categoryId;
  String createdBy;

  AddMenu({
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemDes,
    required this.categoryId,
    required this.createdBy,
  });

  factory AddMenu.fromJson(Map<String, dynamic> json) => AddMenu(

    itemName: json['itemName'],
    itemImage: json['itemImage'],
    itemPrice: json['itemPrice'],
    itemDes: json['itemDes'],
    categoryId: json['categoryId'],
    createdBy: json['createdBy']

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