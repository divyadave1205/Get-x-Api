// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
   required this.email,
   required this.password,
   required this.name,
  });

  String email;
  String password;
  String name;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    email: json["email"],
    password: json["password"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
  };
}
