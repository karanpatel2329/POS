import 'dart:convert';

List<ETableModel> eTableModelFromJson(String str) => List<ETableModel>.from(json.decode(str).map((x) => ETableModel.fromJson(x)));

String eTableModelToJson(List<ETableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ETableModel {
    // String id;
    String ownerId;
    String tableName;
    int seater;
    // int v;

    ETableModel({
        // required this.id,
        required this.ownerId,
        required this.tableName,
        required this.seater,
        // required this.v,
    });

    factory ETableModel.fromJson(Map<String, dynamic> json) => ETableModel(
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
