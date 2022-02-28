import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

class EditEventScreenController extends GetxController {
  TextEditingController editEventNameController = TextEditingController();
  TextEditingController editEventDescriptionController =
      TextEditingController();
  TextEditingController editEventDateController = TextEditingController();
  TextEditingController editEventStartTimeController = TextEditingController();
  TextEditingController editEventEndTimeController = TextEditingController();
  TextEditingController editEventCityController = TextEditingController();
  TextEditingController editEventAddressController = TextEditingController();
  TextEditingController editEventAdditionalInformationController =
      TextEditingController();
  TextEditingController editImageNameController = TextEditingController();
  File? image;
  String? imagePath;
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

  Future<bool?> editEvent({required String editEventId}) async {
    try {
      String url = APIUtilities.editEvent;
      // try {
      //   print('ImagePath==>>>>>${image!.path}');
      //   var request = http.MultipartRequest("POST", Uri.parse(url))
      //     ..files.add(await http.MultipartFile.fromPath(
      //         'feature_image', image!.path,filename: imageNameController.text,
      //         contentType: MediaType("img", "jpg")))
      //     ..fields['title']=blogTitleController.text
      //     ..fields["content"]=blogContentController.text;
      //   var response =await request.send();
      //   //     .then((value) {
      //   //  // print("STATUS CODE===>>>>>${value.statusCode}");
      //   //   print("2===>>>>>${value.contentLength}");
      //   //   print("3===>>>>>${value.headers}");
      //   // });
      //   // response.stream.bytesToString().asStream().listen((event) {
      //   //   // var parsedJson = jsonDecode(event);
      //   //   // print("Parsed Json===>>>>$event");
      //   //   print("${response.statusCode}");
      //   // });
      //   if (response.statusCode == 200) {
      //     print(response.headers);
      //     print('DONE');
      //     update();
      //   } else {
      //     print('TRY NEW SOMETHING');
      //   }
      // } catch (e) {
      //   print('ERROR====????${e}');
      // }

      var req = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      )
        ..fields["event_id"] = editEventId
        ..fields['event_name'] = editEventNameController.text
        ..fields["description"] = editEventDescriptionController.text
        ..fields["date"] = editEventDateController.text
        ..fields["start_time"] = editEventStartTimeController.text
        ..fields["end_time"] = editEventEndTimeController.text
        ..fields["city"] = editEventCityController.text
        ..fields["address"] = editEventAddressController.text
        ..fields["additional_information"] =
            editEventAdditionalInformationController.text
        ..files.add(await http.MultipartFile.fromPath(
            'event_image', image!.path,
            filename: editImageNameController.text,
            contentType: MediaType('image', "jpg")));

      var response = await req.send();
      if (response.statusCode == 200) {
        response.stream.bytesToString().asStream().listen((event) {});

        return true;
      }
      return false;
    } catch (e) {}
  }
}
