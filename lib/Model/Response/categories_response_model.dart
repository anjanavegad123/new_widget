// To parse this JSON data, do
//
//     final categoriesResponseModel = categoriesResponseModelFromJson(jsonString);

import 'dart:convert';

List<String> categoriesResponseModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoriesResponseModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
