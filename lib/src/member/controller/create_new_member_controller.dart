import 'package:get/get.dart';
import 'package:mbo_admin_pannel/api/member/get_member_detail_api.dart';
import 'package:mbo_admin_pannel/src/member/model/get_user_detail_model.dart';

class MemberDetailScreenController extends GetxController {
  UserDetailResponseModel? _userDetail;

  UserDetailResponseModel? get userDetail => _userDetail;

  set userDetail(UserDetailResponseModel? value) {
    _userDetail = value;
    update();
  }

  Future<bool> getUserDetail({required String userDetailId}) async {
    UserDetailResponseModel? data =
        await getUserDetailApi(userId: userDetailId);
    if (data != null) {
      userDetail = data;
      update();
      print(data);
      print(userDetail);
      return true;
    }
    return false;
  }
}
