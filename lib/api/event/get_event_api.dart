import 'package:mbo_admin_pannel/src/events/model/event_model.dart';
import 'package:mbo_admin_pannel/utilities/api_utilitis.dart';

import '../api_manager.dart';

Future<GetEventModel?> getEventApi() async {
  try {
    Map<String, dynamic> response =
        await API.callAPI(url: APIUtilities.getEvent, type: APIType.tGet);
    if (response != null) {
      var result = GetEventModel.fromJson(response);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

Future deleteEventApi({required String deleteEventId}) async {
  try {
    var response = await API.callAPI(
        url: APIUtilities.deleteEvent + deleteEventId, type: APIType.tGet);

    return response;
  } catch (e) {}
}

Future addEventApi({required}) async {}
