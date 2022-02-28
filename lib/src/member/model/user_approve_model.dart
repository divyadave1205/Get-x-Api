// To parse this JSON data, do
//
//     final userApproveModel = userApproveModelFromJson(jsonString);

import 'dart:convert';

UserApproveModel userApproveModelFromJson(String str) => UserApproveModel.fromJson(json.decode(str));

String userApproveModelToJson(UserApproveModel data) => json.encode(data.toJson());

class UserApproveModel {
  UserApproveModel({
   required this.userId,
   required this.isActive,
  });

  String userId;
  String isActive;

  factory UserApproveModel.fromJson(Map<String, dynamic> json) => UserApproveModel(
    userId: json["user_id"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "is_active": isActive,
  };
}
