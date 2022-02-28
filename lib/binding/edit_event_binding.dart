import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/events/controller/edit_event_screen_controller.dart';

class EditEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditEventScreenController(),
        tag: EditEventScreenController().toString());
    // TODO: implement dependencies
  }
}
