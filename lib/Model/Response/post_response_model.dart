// To parse this JSON data, do
//
//     final postResponseModel = postResponseModelFromJson(jsonString);

import 'dart:convert';

List<PostResponseModel> postResponseModelFromJson(String str) =>
    List<PostResponseModel>.from(
        json.decode(str).map((x) => PostResponseModel.fromJson(x)));

String postResponseModelToJson(List<PostResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResponseModel {
  int userId;
  int id;
  String title;
  String body;

  PostResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      //fromjson used for string hoy tyre use thay
      PostResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        //tojson Map hoy tyre use thay..
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
