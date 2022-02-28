import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/member/controller/member_controller.dart';


class MemberBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MemberScreenController(),tag: MemberScreenController().toString());
    // TODO: implement dependencies
  }
}