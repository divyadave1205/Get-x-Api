import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

class CreateNewEventScreenController extends GetxController {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventStartTimeController = TextEditingController();
  TextEditingController eventEndTimeController = TextEditingController();
  TextEditingController eventCityController = TextEditingController();
  TextEditingController eventAddressController = TextEditingController();
  TextEditingController eventAdditionalInformationController =
      TextEditingController();
  TextEditingController imageNameController = TextEditingController();
  File? image;
  String? imagePath;
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

  Future<bool?> addEvent() async {
    try {
      String url = APIUtilities.addEvent;

      var req = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      )
        ..fields['event_name'] = eventNameController.text
        ..fields["description"] = eventDescriptionController.text
        ..fields["date"] = eventDateController.text
        ..fields["start_time"] = eventStartTimeController.text
        ..fields["end_time"] = eventEndTimeController.text
        ..fields["city"] = eventCityController.text
        ..fields["address"] = eventAddressController.text
        ..fields["additional_information"] =
            eventAdditionalInformationController.text
        ..files.add(await http.MultipartFile.fromPath(
            'event_image', image!.path,
            filename: imageNameController.text,
            contentType: MediaType('image', "jpg")));

      var response = await req.send();
      if (response.statusCode == 200) {
        response.stream.bytesToString().asStream().listen((event) {});

        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    imageNameController.dispose();
    eventAdditionalInformationController.dispose();
    eventAddressController.dispose();
    eventCityController.dispose();
    eventEndTimeController.dispose();
    eventStartTimeController.dispose();
    eventDateController.dispose();
    eventDescriptionController.dispose();
    eventNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
