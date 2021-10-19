import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RecordsDataModel {
  RecordsDataModel({
    required this.userId,
    required this.dateTime,
    required this.answers,
    required this.date,
    required this.total,
    required this.result,
    required this.pr,
  });

  final String userId;
  final String dateTime;
  final Map answers;
  final double total;
  final double result;
  final double pr;
  final Timestamp date;

  factory RecordsDataModel.fromJson(String str) =>
      RecordsDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecordsDataModel.fromMap(Map<String, dynamic> json) =>
      RecordsDataModel(
        userId: json["user_id"],
        dateTime: json["date_time"],
        answers: json["answers"],
        pr: double.parse(json["pr"].toString()),
        result: double.parse(json["result"].toString()),
        total: double.parse(json["total"].toString()),
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "date_time": dateTime,
        "answers": answers,
        "pr": pr,
        "result": result,
        "total": total,
        "date": date,
      };
}
