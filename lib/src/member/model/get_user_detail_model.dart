// To parse this JSON data, do
//
//     final userDetailResponseModel = userDetailResponseModelFromJson(jsonString);

import 'dart:convert';

UserDetailResponseModel userDetailResponseModelFromJson(String str) =>
    UserDetailResponseModel.fromJson(json.decode(str));

String userDetailResponseModelToJson(UserDetailResponseModel data) =>
    json.encode(data.toJson());

class UserDetailResponseModel {
  UserDetailResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  Data data;

  factory UserDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      UserDetailResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.personalInfo,
    required this.workInformation,
    required this.approvals,
  });

  List<PersonalInfo> personalInfo;
  List<Map<String, String>> workInformation;
  List<Approval> approvals;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        personalInfo: List<PersonalInfo>.from(
            json["personal_info"].map((x) => PersonalInfo.fromJson(x))),
        workInformation: List<Map<String, String>>.from(json["work_information"]
            .map((x) => Map.from(x).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
        approvals: List<Approval>.from(
            json["approvals"].map((x) => Approval.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "personal_info":
            List<dynamic>.from(personalInfo.map((x) => x.toJson())),
        "work_information": List<dynamic>.from(workInformation.map((x) =>
            Map.from(x).map(
                (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "approvals": List<dynamic>.from(approvals.map((x) => x.toJson())),
      };
}

class Approval {
  Approval({
    this.id,
    this.firstIdentifireId,
    this.firstIdentifire,
    this.secondIdentifireId,
    this.secondIdentifire,
    this.thirdIdentifireId,
    this.thirdIdentifire,
    this.userId,
    this.date,
  });

  String? id;
  String? firstIdentifireId;
  String? firstIdentifire;
  String? secondIdentifireId;
  String? secondIdentifire;
  String? thirdIdentifireId;
  String? thirdIdentifire;
  String? userId;
  String? date;

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        id: json["id"],
        firstIdentifireId: json["first_identifire_id"],
        firstIdentifire: json["first_identifire"],
        secondIdentifireId: json["second_identifire_id"],
        secondIdentifire: json["second_identifire"],
        thirdIdentifireId: json["third_identifire_id"],
        thirdIdentifire: json["third_identifire"],
        userId: json["user_id"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_identifire_id": firstIdentifireId,
        "first_identifire": firstIdentifire,
        "second_identifire_id": secondIdentifireId,
        "second_identifire": secondIdentifire,
        "third_identifire_id": thirdIdentifireId,
        "third_identifire": thirdIdentifire,
        "user_id": userId,
        "date": date,
      };
}

class PersonalInfo {
  PersonalInfo({
    this.id,
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
    this.age,
    this.hobby1,
    this.hobby2,
    this.hobby3,
    this.hobby4,
    this.hobby5,
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
  String? age;
  String? hobby1;
  String? hobby2;
  String? hobby3;
  String? hobby4;
  String? hobby5;
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

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        id: json["id"],
        nameTitle: json["name_title"],
        fullName: json["full_name"],
        loginEmail: json["login_email"],
        password: json["password"],
        firstName: json["first_name"],
        fatherName: json["father_name"],
        familyName: json["family_name"],
        idPhoto: json["id_photo"],
        loginType: json["login_type"],
        dateOfBirth: json["date_of_birth"],
        age: json["age"],
        hobby1: json["hobby1"],
        hobby2: json["hobby2"],
        hobby3: json["hobby3"],
        hobby4: json["hobby4"],
        hobby5: json["hobby5"],
        socialStatus: json["social_status"],
        numberOfSonDaughter: json["number_of_son_daughter"],
        address: json["address"],
        city: json["city"],
        postalCode: json["postal_code"],
        poBox: json["po_box"],
        phoneNumber: json["phone_number"],
        contactEmail: json["contact_email"],
        cellPhone: json["cell_phone"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        facebook: json["facebook"],
        isActive: json["is_active"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "name_title": nameTitle ?? '',
        "full_name": fullName ?? '',
        "login_email": loginEmail ?? '',
        "password": password ?? '',
        "first_name": firstName ?? '',
        "father_name": fatherName ?? '',
        "family_name": familyName ?? '',
        "id_photo": idPhoto ?? '',
        "login_type": loginType ?? '',
        "date_of_birth": dateOfBirth ?? '',
        "age": age ?? '',
        "hobby1": hobby1 ?? '',
        "hobby2": hobby2 ?? '',
        "hobby3": hobby3 ?? '',
        "hobby4": hobby4 ?? '',
        "hobby5": hobby5 ?? '',
        "social_status": socialStatus ?? '',
        "number_of_son_daughter": numberOfSonDaughter ?? '',
        "address": address ?? '',
        "city": city ?? '',
        "postal_code": postalCode ?? '',
        "po_box": poBox ?? '',
        "phone_number": phoneNumber ?? '',
        "contact_email": contactEmail ?? '',
        "cell_phone": cellPhone ?? '',
        "instagram": instagram ?? '',
        "twitter": twitter ?? '',
        "facebook": facebook ?? '',
        "is_active": isActive ?? '',
        "date": date ?? '',
      };
}

class WorkInformation {
  WorkInformation({
    this.id,
    this.workSpaceName,
    this.currentPosition,
    this.companyLogo,
    this.landmark,
    this.area,
    this.buildingName,
    this.street,
    this.phoneNumber1,
    this.phoneNumber2,
    this.city,
    this.postalCode,
    this.poBox,
    this.workEmail,
    this.businessFacilities,
    this.companySector,
    this.companyWebsite,
    this.managerName,
    this.managerNumber,
    this.managerEmail,
    this.userId,
  });

  String? id;
  String? workSpaceName;
  String? currentPosition;
  String? companyLogo;
  String? landmark;
  String? area;
  String? buildingName;
  String? street;
  String? phoneNumber1;
  String? phoneNumber2;
  String? city;
  String? postalCode;
  String? poBox;
  String? workEmail;
  String? businessFacilities;
  String? companySector;
  String? companyWebsite;
  String? managerName;
  String? managerNumber;
  String? managerEmail;
  String? userId;

  factory WorkInformation.fromJson(Map<String, dynamic> json) =>
      WorkInformation(
        id: json["id"],
        workSpaceName: json["work_space_name"],
        currentPosition: json["current_position"],
        companyLogo: json["company_logo"],
        landmark: json["landmark"],
        area: json["area"],
        buildingName: json["building_name"],
        street: json["street"],
        phoneNumber1: json["phone_number1"],
        phoneNumber2: json["phone_number2"],
        city: json["city"],
        postalCode: json["postal_code"],
        poBox: json["po_box"],
        workEmail: json["work_email"],
        businessFacilities: json["business_facilities"],
        companySector: json["company_sector"],
        companyWebsite: json["company_website"],
        managerName: json["manager_name"],
        managerNumber: json["manager_number"],
        managerEmail: json["manager_email"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "work_space_name": workSpaceName ?? '',
        "current_position": currentPosition ?? '',
        "company_logo": companyLogo ?? '',
        "landmark": landmark ?? '',
        "area": area ?? '',
        "building_name": buildingName ?? '',
        "street": street ?? '',
        "phone_number1": phoneNumber1 ?? '',
        "phone_number2": phoneNumber2 ?? '',
        "city": city ?? '',
        "postal_code": postalCode ?? '',
        "po_box": poBox ?? '',
        "work_email": workEmail ?? '',
        "business_facilities": businessFacilities ?? '',
        "company_sector": companySector ?? '',
        "company_website": companyWebsite ?? '',
        "manager_name": managerName ?? '',
        "manager_number": managerNumber ?? '',
        "manager_email": managerEmail ?? '',
        "user_id": userId ?? '',
      };
}
