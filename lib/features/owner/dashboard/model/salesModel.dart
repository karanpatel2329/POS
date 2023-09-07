import 'dart:convert';

SalesModel salesModelFromJson(String str) => SalesModel.fromJson(json.decode(str));

String salesModelToJson(SalesModel data) => json.encode(data.toJson());

class SalesModel {
    Data? data;

    SalesModel({
        this.data,
    });

    factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    List<Sale> sales;
    double total;

    Data({
        required this.sales,
        required this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        sales: List<Sale>.from(json["sales"].map((x) => Sale.fromJson(x))),
        total: json["total"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "sales": List<dynamic>.from(sales.map((x) => x.toJson())),
        "total": total,
    };
}

class Sale {
    String createdAt;
    double total;

    Sale({
        required this.createdAt,
        required this.total,
    });

    factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        createdAt: json["createdAt"],
        total: json["total"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "total": total,
    };
}