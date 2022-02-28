import 'package:mbo_admin_pannel/src/blog/model/get_blog_model.dart';
import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

import '../api_manager.dart';

Future<GetBlogModel?> getBlogApi() async {
  try {
    Map<String, dynamic> response =
        await API.callAPI(url: APIUtilities.getBlog, type: APIType.tGet);
    if (response != null) {
      var result = GetBlogModel.fromMap(response);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

Future deleteBlogApi({required String deleteBlogId}) async {
  try {
    var response = await API.callAPI(
        url: APIUtilities.deleteBlog + deleteBlogId, type: APIType.tGet);
    return response;
  } catch (e) {
    print(e);
  }
}

Future<GetBlogModel?> editBlogApi() async {}
