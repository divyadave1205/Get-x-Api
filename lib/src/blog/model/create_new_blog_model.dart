// To parse this JSON data, do
//
//     final createBlogModel = createBlogModelFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

CreateBlogModel createBlogModelFromJson(String str) => CreateBlogModel.fromJson(json.decode(str));

String createBlogModelToJson(CreateBlogModel data) => json.encode(data.toJson());

class CreateBlogModel {
  CreateBlogModel({
    required this.title,
    required this.featureImage,
    required this.content,
    required this.attachment,
  });

  String title;
  File featureImage;
  String content;
  File attachment;

  factory CreateBlogModel.fromJson(Map<String, dynamic> json) => CreateBlogModel(
    title: json["title"],
    featureImage: json["feature_image"],
    content: json["content"],
    attachment: json["attachment"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "feature_image": featureImage,
    "content": content,
    "attachment": attachment,
  };
}
