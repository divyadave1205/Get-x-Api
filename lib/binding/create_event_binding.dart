import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/events/controller/create_new_event_screen_controller.dart';

class CreateNewEventBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CreateNewEventScreenController(),tag: CreateNewEventScreenController().toString());
    // TODO: implement dependencies
  }

}