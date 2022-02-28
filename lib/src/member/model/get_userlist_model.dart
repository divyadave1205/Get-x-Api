import 'dart:convert';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';

class PageModel {
  final String title;
  final String navigator;

  PageModel(this.title, this.navigator);
}

List<PageModel> pageModel = [
  PageModel("memberTitleText".tr, RouteUtilities.memberScreen),
  PageModel("BlogTitleText".tr, RouteUtilities.blogScreen),
  PageModel("EventTitleText".tr, RouteUtilities.eventScreen),
  PageModel("ReportTitleText".tr, RouteUtilities.reportsScreen),
  PageModel("PotentialMemberTitleText".tr, RouteUtilities.memberScreen),
  PageModel("OnlineChatTitleChat".tr, RouteUtilities.onlinechatScreen),
  PageModel("membershipTitleText".tr, RouteUtilities.membershipScreen),
];
// To parse this JSON data, do
//
//     final getUserListModel = getUserListModelFromJson(jsonString);

GetUserListModel getUserListModelFromJson(String str) =>
    GetUserListModel.fromJson(json.decode(str));

String getUserListModelToJson(GetUserListModel data) =>
    json.encode(data.toJson());

class GetUserListModel {
  GetUserListModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  List<Datum> data;

  factory GetUserListModel.fromJson(Map<String, dynamic> json) =>
      GetUserListModel(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    this.nameTitle,
    this.fullName,
    this.loginEmail,
    this.password,
    this.firstName,
    this.fatherName,
    this.familyName,
    this.idPhoto,
    this.loginType,
    this.dateOfBirth,
    this.socialStatus,
    this.numberOfSonDaughter,
    this.address,
    this.city,
    this.postalCode,
    this.poBox,
    this.phoneNumber,
    this.contactEmail,
    this.cellPhone,
    this.instagram,
    this.twitter,
    this.facebook,
    this.isActive,
    this.date,
  });

  String? id;
  String? nameTitle;
  String? fullName;
  String? loginEmail;
  String? password;
  String? firstName;
  String? fatherName;
  String? familyName;
  String? idPhoto;
  String? loginType;
  String? dateOfBirth;
  String? socialStatus;
  String? numberOfSonDaughter;
  String? address;
  String? city;
  String? postalCode;
  String? poBox;
  String? phoneNumber;
  String? contactEmail;
  String? cellPhone;
  String? instagram;
  String? twitter;
  String? facebook;
  String? isActive;
  String? date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? "",
        nameTitle: json["name_title"] ?? "",
        fullName: json["full_name"] ?? "",
        loginEmail: json["login_email"] ?? "",
        password: json["password"] ?? "",
        firstName: json["first_name"] ?? "",
        fatherName: json["father_name"] ?? "",
        familyName: json["family_name"] ?? "",
        idPhoto: json["id_photo"] ?? "",
        loginType: json["login_type"] ?? "",
        dateOfBirth: json["date_of_birth"] ?? "",
        socialStatus: json["social_status"] ?? "",
        numberOfSonDaughter: json["number_of_son_daughter"] ?? "",
        address: json["address"] ?? "",
        city: json["city"] ?? "",
        postalCode: json["postal_code"] ?? "",
        poBox: json["po_box"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        contactEmail: json["contact_email"] ?? "",
        cellPhone: json["cell_phone"] ?? "",
        instagram: json["instagram"] ?? "",
        twitter: json["twitter"] ?? "",
        facebook: json["facebook"] ?? "",
        isActive: json["is_active"] ?? "",
        date: json["date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_title": nameTitle,
        "full_name": fullName,
        "login_email": loginEmail,
        "password": password,
        "first_name": firstName,
        "father_name": fatherName,
        "family_name": familyName,
        "id_photo": idPhoto,
        "login_type": loginType,
        "date_of_birth": dateOfBirth,
        "social_status": socialStatus,
        "number_of_son_daughter": numberOfSonDaughter,
        "address": address,
        "city": city,
        "postal_code": postalCode,
        "po_box": poBox,
        "phone_number": phoneNumber,
        "contact_email": contactEmail,
        "cell_phone": cellPhone,
        "instagram": instagram,
        "twitter": twitter,
        "facebook": facebook,
        "is_active": isActive,
        "date": date,
      };
}
