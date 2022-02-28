import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/api/auth/auth_api.dart';
import 'package:mbo_admin_pannel/src/auth/model/auth_model.dart';

class LoginScreenControlller extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<bool> authAdmin(
      {required String authEmail,
      required String authName,
      required String authPassword}) async {
    Map<String, dynamic> body =
        AuthModel(email: authEmail, password: authPassword, name: authName)
            .toJson();
    var data = await authApi(reqBody: body);
    if (data != null) {
      return true;
    }
    return false;
  }
}
