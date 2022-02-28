import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/member/controller/create_new_member_controller.dart';

class MemberDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MemberDetailScreenController(),tag: MemberDetailScreenController().toString());
    // TODO: implement dependencies
  }

}