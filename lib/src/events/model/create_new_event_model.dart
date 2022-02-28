// To parse this JSON data, do
//
//     final creatEventModel = creatEventModelFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

CreateEventModel createEventModelFromJson(String str) => CreateEventModel.fromJson(json.decode(str));

String createEventModelToJson(CreateEventModel data) => json.encode(data.toJson());

class CreateEventModel {
  CreateEventModel({
   required this.eventName,
   required this.eventImage,
   required this.description,
   required this.date,
   required this.startTime,
   required this.endTime,
   required this.city,
   required this.address,
   required this.additionalInformation,
  });

  String eventName;
  File eventImage;
  String description;
  String date;
  String startTime;
  String endTime;
  String city;
  String address;
  String additionalInformation;

  factory CreateEventModel.fromJson(Map<String, dynamic> json) => CreateEventModel(
    eventName: json["event_name"],
    eventImage: json["event_image"],
    description: json["description"],
    date: json["date"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    city: json["city"],
    address: json["address"],
    additionalInformation: json["additional_information"],
  );

  Map<String, dynamic> toJson() => {
    "event_name": eventName,
    "event_image": eventImage,
    "description": description,
    "date": date,
    "start_time": startTime,
    "end_time": endTime,
    "city": city,
    "address": address,
    "additional_information": additionalInformation,
  };
}
