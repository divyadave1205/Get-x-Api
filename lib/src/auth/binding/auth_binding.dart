import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/auth/controller/login_screen_controlller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginScreenControlller(), tag: LoginScreenControlller().toString());
  }
}
