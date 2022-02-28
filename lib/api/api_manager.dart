import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mbo_admin_pannel/widget/custom_snackbar.dart';

enum APIType {
  tPost,
  tGet,
  tPut,
}

class API {
  static Future<dynamic> callAPI({
    required String url,
    required APIType type,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      http.Response apiResponse;

      dynamic apiBody = body;

      /// [POST CALL]
      if (type == APIType.tPost) {
        assert(body != null);

        /// call the api with the specified url using post method.
        apiResponse = await http.post(
          Uri.parse(url),
          body: apiBody,
        );
      }

      /// [GET CALL]
      else if (type == APIType.tGet) {
        /// call the api with the specified url using get method.
        apiResponse = await http.get(
          Uri.parse(url),
        );
      } else {
        /// call the api with hte specified url using put method.
        apiResponse = await http.put(
          Uri.parse(url),
          body: apiBody,
        );
      }

      Map<String, dynamic> response = jsonDecode(apiResponse.body);
      switch (apiResponse.statusCode) {
        case 200:
          if (response["status"] == 1) {
            // showMySnackBar(
            //   title: "apiManagerValidationTitleMessage".tr,
            //   message: response["message"].toString(),
            //   type: SnackType.success,
            // );

            return response;
          } else {
            /// whene there is any error from the server, then return null and show the message.
            showMySnackBar(
              title: "apiManagerValidationTitleMessage".tr,
              message: response["msg"].toString(),
              type: SnackType.error,
            );
            return null;
          }

        case 500: // server error !
          /// when the error is from server side then it manage the response and show the snack accordingly.
          showMySnackBar(
            title: "apiManagerValidationTitleMessage".tr,
            message: "apiManagerValidationServerSideMessage".tr,
            type: SnackType.error,
          );
          return null;

        case 404: // page not found !

          /// when the page called from the application is not found then it show the message.
          showMySnackBar(
            title: "apiManagerValidationTitleMessage".tr,
            message: "apiManagerValidationPageNotFoundMessage".tr,
            type: SnackType.error,
          );
          return null;
        case 400: // bad request !

          /// when the request is made with some mistakes or bad or improper parameters this part will execute.
          showMySnackBar(
            title: "apiManagerValidationTitleMessage".tr,
            message: response["message"].toString(),
            type: SnackType.error,
          );
          return null;

        case 401:
          showMySnackBar(
            title: "apiManagerValidationTitleMessage".tr,
            message: response["message"].toString(),
            type: SnackType.error,
          );

          return null;
        default:

          /// when there is some other errors like searver, page-not-found, bad connection then it will return null.
          showMySnackBar(
            title: "apiManagerValidationTitleMessage".tr,
            message: "apiManagerValidationDefaultMessage".tr,
            type: SnackType.error,
          );
          return null;
      }
    } catch (e) {
      return null;
    }
  }
}
