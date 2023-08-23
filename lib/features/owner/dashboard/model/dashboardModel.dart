// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  String? name;
  int? totalRevenue;
  int? totalCurrentOrders;
  int? totalCompletedOrders;
  int? totalMenuCount;

  DashboardModel({
     this.name,
     this.totalRevenue,
     this.totalCurrentOrders,
     this.totalCompletedOrders,
     this.totalMenuCount,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    name: json["name"],
    totalRevenue: json["totalRevenue"],
    totalCurrentOrders: json["totalCurrentOrders"],
    totalCompletedOrders: json["totalCompletedOrders"],
    totalMenuCount: json["totalMenuCount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "totalRevenue": totalRevenue,
    "totalCurrentOrders": totalCurrentOrders,
    "totalCompletedOrders": totalCompletedOrders,
    "totalMenuCount": totalMenuCount,
  };
}
