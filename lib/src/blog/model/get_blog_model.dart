// To parse this JSON data, do
//
//     final getBlogModel = getBlogModelFromMap(jsonString);

import 'dart:convert';

class GetBlogModel {
  GetBlogModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  final int status;
  final String msg;
  final List<Datum> data;

  factory GetBlogModel.fromJson(String str) =>
      GetBlogModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetBlogModel.fromMap(Map<String, dynamic> json) => GetBlogModel(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.featureImage,
    required this.attachment,
    required this.writer,
    required this.content,
    required this.created,
    required this.updated,
  });

  final String id;
  final String title;
  final String? featureImage;
  final dynamic attachment;
  final String? writer;
  final String? content;
  final DateTime created;
  final DateTime updated;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        featureImage:
            json["feature_image"] == null ? null : json["feature_image"],
        attachment: json["attachment"],
        writer: json["writer"] == null ? null : json["writer"],
        content: json["content"] == null ? null : json["content"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "feature_image": featureImage == null ? null : featureImage,
        "attachment": attachment,
        "writer": writer == null ? null : writer,
        "content": content == null ? null : content,
        "created": created == null
            ? null
            : "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "updated": updated == null
            ? null
            : "${updated.year.toString().padLeft(4, '0')}-${updated.month.toString().padLeft(2, '0')}-${updated.day.toString().padLeft(2, '0')}",
      };
}
