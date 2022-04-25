// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';
/*
class HistoryModel {
  HistoryModel({
    this.date,
    this.id,
    this.title,
    this.body,
  });

  String date;
  int id;
  String title;
  String body;

 
}*/

class HistoryItem {
  final String date;
  final String id;
  final String title;
  final String body;

  HistoryItem({this.date,this.id,this.title,this.body});

  HistoryItem.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() {
    return {
      'date':date,
      'id': id,
      'title':title,
      'body':body,
    };
  }
}

