import 'dart:convert';

class Event {
  final String subject;
  final String date;
  final String writerName;

  Event({required this.subject, required this.date, required this.writerName});
}

final allEventDetail = <Event>[
  Event(writerName: "Name1", date: "12/1/2021", subject: 'Sub1'),
  Event(writerName: "Name2", date: "22/2/2021", subject: 'Sub2'),
  Event(writerName: "Name5", date: "11/12/2021", subject: 'Sub3'),
  Event(writerName: "Name4", date: "1/11/2021", subject: 'Sub4'),
  Event(writerName: "Name6", date: "2/10/2021", subject: 'Sub5'),
  Event(writerName: "Name8", date: "5/5/2021", subject: 'Sub6'),
  Event(writerName: "Name12", date: "8/1/2021", subject: 'Sub7'),
  Event(writerName: "Name11", date: "12/1/2021", subject: 'Sub9'),
  Event(writerName: "Name10", date: "22/5/2021", subject: 'Sub11'),
  Event(writerName: "Name3", date: "16/8/2021", subject: 'Sub10'),
  Event(writerName: "Name7", date: "19/8/2021", subject: 'Sub15'),
  Event(writerName: "Name9", date: "21/7/2021", subject: 'Sub14'),
  Event(writerName: "Name13", date: "13/7/2021", subject: 'Sub13'),
];
// To parse this JSON data, do
//
//     final getEventModel = getEventModelFromJson(jsonString);

GetEventModel getEventModelFromJson(String str) =>
    GetEventModel.fromJson(json.decode(str));

String getEventModelToJson(GetEventModel data) => json.encode(data.toJson());

class GetEventModel {
  GetEventModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  List<Datum> data;

  factory GetEventModel.fromJson(Map<String, dynamic> json) => GetEventModel(
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
    required this.eventName,
    required this.eventImage,
    required this.description,
    required this.date,
    required this.writer,
    required this.startTime,
    required this.endTime,
    required this.city,
    required this.address,
    required this.additionalInformation,
  });

  String id;
  String eventName;
  String eventImage;
  String description;
  String date;
  String writer;
  String startTime;
  String endTime;
  String city;
  String address;
  String additionalInformation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        eventName: json["event_name"],
        eventImage: json["event_image"],
        description: json["description"],
        date: json["date"],
        writer: json["writer"] ?? '',
        startTime: json["start_time"],
        endTime: json["end_time"],
        city: json["city"],
        address: json["address"],
        additionalInformation: json["additional_information"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
