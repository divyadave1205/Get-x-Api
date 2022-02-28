import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/member/controller/member_controller.dart';
import 'package:mbo_admin_pannel/src/member/model/get_userlist_model.dart';
import 'package:mbo_admin_pannel/src/member/view/member_detaile_screen.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_drawer.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final MemberScreenController _memberScreenController =
      Get.find(tag: MemberScreenController().toString());
  @override
  void initState() {
    _memberScreenController.getListOfUser();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "memberTitleText".tr,
          )),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "searchTitleTextFieldText".tr,
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: const Icon(Icons.search),
                          fillColor: ColorUtilities.blueshadowColor,
                          filled: true),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GetBuilder<MemberScreenController>(
                  init: _memberScreenController,
                  builder: (_) => _memberScreenController.getUserList == null
                      ? const Center(child: CircularProgressIndicator())
                      : buildRequestTable(
                          data: _memberScreenController.getUserList!.data))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRequestTable({required List<Datum> data}) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dividerThickness: 2.0,
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => ColorUtilities.blueColor),
        headingTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'nameTitle'.tr,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'dateTitle'.tr,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'membershipTitle'.tr,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'actionTitle'.tr,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: <DataRow>[
          ...data
              .map((e) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(e.nameTitle ?? '')),
                      DataCell(Text(e.date ?? '')),
                      DataCell(Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    primary: e.isActive == '1'
                                        ? ColorUtilities.greenColor
                                        : ColorUtilities.redColor),
                                onPressed: () {
                                  _memberScreenController
                                      .postApproveDisApproveUser(
                                          id: e.id!,
                                          userStatus:
                                              e.isActive == "1" ? "0" : "1");
                                },
                                child: e.isActive == "1"
                                    ? Text('approvedTitle'.tr)
                                    : Text('disApprovedTitle'.tr)),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed(RouteUtilities.memberDetailScreen,
                                  arguments: ReadMemberDetailArgument(
                                      memberId: e.id.toString()));
                            },
                            icon: const Icon(Icons.info_outline,
                                size: 20, color: ColorUtilities.blueColor),
                          )
                        ],
                      )),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.edit,
                              color: ColorUtilities.blueColor,
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.delete, color: Colors.red),
                          ],
                        ),
                      ),
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }
}
