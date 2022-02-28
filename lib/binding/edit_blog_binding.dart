import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/blog/controller/edit_blog_screen_controller.dart';

class EditBlogBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditBlogScreenController(),tag: EditBlogScreenController().toString());
    // TODO: implement dependencies
  }

}