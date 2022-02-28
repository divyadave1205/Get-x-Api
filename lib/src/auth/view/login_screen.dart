import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/auth/controller/login_screen_controlller.dart';
import 'package:mbo_admin_pannel/utilities/assets_utilities.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginScreenControlller _loginScreenControlller =
      Get.find(tag: LoginScreenControlller().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.85),
          ),
          const Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage(AssetUtilities.applicationLogo),
                height: 150,
                width: 250,
              )),
          GetBuilder<LoginScreenControlller>(
              init: _loginScreenControlller,
              builder: (_) => Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: Get.height * 0.5,
                      width: Get.width * 0.8,
                      color: Colors.white.withOpacity(0.4),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _loginScreenControlller.nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "nameText".tr,
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _loginScreenControlller.emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "EmailText".tr,
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller:
                                _loginScreenControlller.passwordController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "passwordText".tr,
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 40),
                                  primary: ColorUtilities.blueColor),
                              onPressed: () {
                                _loginScreenControlller
                                    .authAdmin(
                                        authEmail: _loginScreenControlller
                                            .emailController.text,
                                        authName: _loginScreenControlller
                                            .nameController.text,
                                        authPassword: _loginScreenControlller
                                            .passwordController.text)
                                    .then((value) {
                                  if (value == true) {
                                    return Get.offNamed(
                                        RouteUtilities.blogScreen);
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                });
                              },
                              child: Text("LogInText".tr)),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ))
        ],
      ),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetUtilities.spalshImage),
              fit: BoxFit.cover)),
    ));
  }
}
