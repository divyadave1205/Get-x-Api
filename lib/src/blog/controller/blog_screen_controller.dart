import 'package:get/get.dart';
import 'package:mbo_admin_pannel/api/blog/blog_api.dart';
import 'package:mbo_admin_pannel/src/blog/model/get_blog_model.dart';

class BlogScreenController extends GetxController {
  GetBlogModel? _getBlogListModel;

  GetBlogModel? get getBlogListModel => _getBlogListModel;

  set getBlogListModel(GetBlogModel? value) {
    _getBlogListModel = value;
    update();
  }

  Future<bool> getBlogList() async {
    GetBlogModel? data = await getBlogApi();
    if (data != null) {
      getBlogListModel = data;
      update();
      return true;
    }
    return false;
  }

  Future deleteBlog({required String blogId}) async {
    var data = await deleteBlogApi(deleteBlogId: blogId);
    if (data != null) {
      getBlogList();
      return true;
    }
    return false;
  }
}
