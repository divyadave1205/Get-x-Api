import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

import '../api_manager.dart';

Future postDisApproveUserApi({required Map<String, dynamic> reqBody}) async {
  try {
    var response = await API.callAPI(
        url: APIUtilities.diApprove, type: APIType.tPost, body: reqBody);

    return response;
  } catch (e) {
    print(e);
  }
}
