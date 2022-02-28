import 'package:mbo_admin_pannel/src/member/model/get_userlist_model.dart';
import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

import '../api_manager.dart';

Future<GetUserListModel?> getMemberListApi() async {
  try {
    Map<String, dynamic>? response =
        await API.callAPI(url: APIUtilities.getMemberList, type: APIType.tGet);
    if (response != null) {
      var result = GetUserListModel.fromJson(response);

      return result;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}
