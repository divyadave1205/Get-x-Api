import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/blog/controller/blog_screen_controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BlogScreenController(), tag: BlogScreenController().toString());
    // TODO: implement dependencies
  }
}
