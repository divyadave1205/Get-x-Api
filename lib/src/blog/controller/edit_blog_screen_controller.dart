import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

class EditBlogScreenController extends GetxController {
  TextEditingController editBlogTitleController = TextEditingController();
  TextEditingController editBlogContentController = TextEditingController();
  TextEditingController editImageNameController = TextEditingController();
  TextEditingController editAttachmentImageNameController =
      TextEditingController();
  File? image;
  String? imagePath;
  File? attachmentImage;
  String? attachmentImagePath;
  final _picker = ImagePicker();
  Future<void> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path.split('/').last;

      editImageNameController.text = imagePath ?? '';

      update();
    } else {}
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path.split('/').last;
      editImageNameController.text = imagePath ?? '';

      update();
    } else {}
  }

  Future<void> attachmentGetImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      attachmentImage = File(pickedFile.path);
      attachmentImagePath = pickedFile.path.split('/').last;

      editAttachmentImageNameController.text = attachmentImagePath ?? '';

      update();
    } else {}
  }

  Future<void> attachmentGetImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      attachmentImage = File(pickedFile.path);
      attachmentImagePath = pickedFile.path.split('/').last;
      editAttachmentImageNameController.text = imagePath ?? '';

      update();
    } else {}
  }

  Future editBlog({required String editBlogId}) async {
    String url = APIUtilities.editBlog;
    var req = http.MultipartRequest('POST', Uri.parse(url))
      ..files.add(await http.MultipartFile.fromPath(
          'attachment', attachmentImage!.path,
          filename: editAttachmentImageNameController.text,
          contentType: MediaType('jpg' 'png', "image")))
      ..fields['title'] = editBlogTitleController.text
      ..fields['blog_id'] = editBlogId
      ..files.add(await http.MultipartFile.fromPath(
          'feature_image', image!.path,
          filename: editImageNameController.text,
          contentType: MediaType('jpg', "image")));

    var response = await req.send();
    response.stream.bytesToString().asStream().listen((event) {});
  }
}
