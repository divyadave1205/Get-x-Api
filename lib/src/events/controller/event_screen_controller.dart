import 'package:get/get.dart';
import 'package:mbo_admin_pannel/api/event/get_event_api.dart';
import 'package:mbo_admin_pannel/src/events/model/event_model.dart';

class EventScreenController extends GetxController {
  GetEventModel? _getEventListModel;

  GetEventModel? get getEventListModel => _getEventListModel;

  set getEventListModel(GetEventModel? value) {
    _getEventListModel = value;
    update();
  }

  Future<bool> getEventList() async {
    GetEventModel? data = await getEventApi();
    if (data != null) {
      getEventListModel = data;
      update();
      return true;
    }
    return false;
  }

  Future<bool> deleteEvent({required String eventId}) async {
    var data = await deleteEventApi(deleteEventId: eventId);
    if (data != null) {
      getEventList();
      return true;
    }
    return false;
  }
}
