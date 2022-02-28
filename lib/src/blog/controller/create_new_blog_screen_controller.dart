import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

class CreateNewBlogScreenController extends GetxController {
  TextEditingController blogTitleController = TextEditingController();
  TextEditingController blogContentController = TextEditingController();
  TextEditingController imageNameController = TextEditingController();
  TextEditingController attachmentImageNameController = TextEditingController();
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

      imageNameController.text = imagePath ?? '';

      update();
    } else {}
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path.split('/').last;
      imageNameController.text = imagePath ?? '';

      update();
    } else {}
  }

  Future<void> attachmentGetImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      attachmentImage = File(pickedFile.path);
      attachmentImagePath = pickedFile.path.split('/').last;

      attachmentImageNameController.text = attachmentImagePath ?? '';

      update();
    } else {}
  }

  Future<void> attachmentGetImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      attachmentImage = File(pickedFile.path);
      attachmentImagePath = pickedFile.path.split('/').last;
      attachmentImageNameController.text = imagePath ?? '';

      update();
    } else {}
  }

  Future addBlog() async {
    String url = APIUtilities.addBlog;
    var req = http.MultipartRequest('POST', Uri.parse(url))
      ..files.add(await http.MultipartFile.fromPath(
          'attachment', attachmentImage!.path,
          filename: attachmentImageNameController.text,
          contentType: MediaType('jpg' 'png', "image")))
      ..fields['title'] = blogTitleController.text
      ..fields["content"] = blogContentController.text
      ..files.add(await http.MultipartFile.fromPath(
          'feature_image', image!.path,
          filename: imageNameController.text,
          contentType: MediaType('jpg' 'png', "image")));

    var response = await req.send();
    response.stream.bytesToString().asStream().listen((event) {});
  }
}
