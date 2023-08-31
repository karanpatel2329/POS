import 'dart:convert';

List<EOrderModel> eOrderModelFromJson(String str) => List<EOrderModel>.from(json.decode(str).map((x) => EOrderModel.fromJson(x)));

String eOrderModelToJson(List<EOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EOrderModel {
    Customer? customer;
    String id;
    String orderType;
    List<Item> items;
    String status;
    String? takeawayName;
    String? tableNumber;
    String? ownerId;
    String? employeeId;
    String cookingStatus;
    double total;
    String paymentStatus;
    String orderId;
    DateTime createdAt;
    int v;

    EOrderModel({
        this.customer,
        required this.id,
        required this.orderType,
        required this.items,
        required this.status,
        this.tableNumber,
        this.takeawayName,
        this.ownerId,
        this.employeeId,
        required this.cookingStatus,
        required this.total,
        required this.paymentStatus,
        required this.orderId,
        required this.createdAt,
        required this.v,
    });

    factory EOrderModel.fromJson(Map<String, dynamic> json) => EOrderModel(
        customer: json["customer"]!=null?Customer.fromJson(json["customer"]):null,
        id: json["_id"],
        orderType: json["orderType"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        status: json["status"],
        tableNumber: json["tableNumber"].toString(),
        takeawayName: json["takeawayName"],
        ownerId: json["ownerId"],
        employeeId: json["employeeId"],
        cookingStatus: json["cookingStatus"],
        total: double.tryParse(json["total"].toString())??0.0,
        paymentStatus: json["paymentStatus"],
        orderId: json["orderID"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "customer": customer!=null?customer!.toJson():null,
        "_id": id,
        "orderType": orderType,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "status": status,
        "takeawayName": takeawayName,
        "ownerId": ownerId,
        "employeeId": employeeId,
        "cookingStatus": cookingStatus,
        "total": total,
        "paymentStatus": paymentStatus,
        "orderID": orderId,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class Customer {
    String name;
    String mobileNumber;

    Customer({
        required this.name,
        required this.mobileNumber,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        mobileNumber: json["mobileNumber"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobileNumber": mobileNumber,
    };
}

class Item {
    String name;
    int quantity;
    String id;

    Item({
        required this.name,
        required this.quantity,
        required this.id,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "_id": id,
    };
}