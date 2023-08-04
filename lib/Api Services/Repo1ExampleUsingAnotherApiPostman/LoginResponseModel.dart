// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String status;
  String message;
  Data data;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int userId;
  String name;

  Data({
    required this.userId,
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
      };
}
