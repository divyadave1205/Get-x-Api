import 'package:mbo_admin_pannel/src/member/model/get_user_detail_model.dart';
import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

import '../api_manager.dart';

Future<UserDetailResponseModel?> getUserDetailApi(
    {required String userId}) async {
  try {
    Map<String, dynamic> response = await API.callAPI(
        url: APIUtilities.getUserDetail + userId, type: APIType.tGet);
    if (response != null) {
      var result = UserDetailResponseModel.fromJson(response);

      return result;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}
