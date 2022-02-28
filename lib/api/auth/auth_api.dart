import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

import '../api_manager.dart';

Future authApi({required Map<String, dynamic> reqBody}) async {
  try {
    var response = await API.callAPI(
        url: APIUtilities.auth, type: APIType.tPost, body: reqBody);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}
