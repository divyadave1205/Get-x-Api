import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/events/controller/event_screen_controller.dart';

class EventBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EventScreenController(),tag: EventScreenController().toString());
    // TODO: implement dependencies
  }

}