import 'dart:convert';

List<TableModel> tableModelFromJson(String str) => List<TableModel>.from(json.decode(str).map((x) => TableModel.fromJson(x)));

String tableModelToJson(List<TableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableModel {
    // String id;
    String ownerId;
    String tableName;
    int seater;
    // int v;

    TableModel({
        // required this.id,
        required this.ownerId,
        required this.tableName,
        required this.seater,
        // required this.v,
    });

    factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        // id: json["_id"],
        ownerId: json["ownerId"],
        tableName: json["tableName"],
        seater: json["seater"],
        // v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        // "_id": id,
        "ownerId": ownerId,
        "tableName": tableName,
        "seater": seater,
        // "__v": v,
    };
}
