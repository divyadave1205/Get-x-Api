import 'package:get/get.dart';
import 'package:mbo_admin_pannel/api/member/get_memberlist_api.dart';
import 'package:mbo_admin_pannel/api/member/post_approve_disapprove_api.dart';
import 'package:mbo_admin_pannel/src/member/model/get_userlist_model.dart';
import 'package:mbo_admin_pannel/src/member/model/user_approve_model.dart';

class MemberScreenController extends GetxController {
  bool _selected = false;

  bool get selected => _selected;

  set selected(bool selected) {
    _selected = selected;
    update();
  }

  GetUserListModel? _getUserList;

  GetUserListModel? get getUserList => _getUserList;

  set getUserList(GetUserListModel? value) {
    _getUserList = value;
    update();
  }

  Future<bool> getListOfUser() async {
    GetUserListModel? data = await getMemberListApi();
    if (data != null) {
      getUserList = data;
      update();

      return true;
    }
    update();
    return false;
  }

  Future postApproveDisApproveUser(
      {required String id, required String userStatus}) async {
    var result = await postDisApproveUserApi(
        reqBody: UserApproveModel(userId: id, isActive: userStatus).toJson());
    if (result != null) {
      getListOfUser();
      update();
      return true;
    }
    return false;
  }
}
