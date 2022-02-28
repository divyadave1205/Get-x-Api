import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mbo_admin_pannel/src/notification/model/notification_model.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_drawer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "notificationsTitleText".tr,
          )),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  IconButton(
                      onPressed: () {
                        //Get.toNamed(RouteUtilities.createNewEventScreen);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: ColorUtilities.blackColor,
                        size: 25,
                      ))
                ],
              ),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         primary: ColorUtilities.blueColor),
              //     onPressed: () {},
              //     child: const Text('Create new')),
              const SizedBox(height: 20),
              const RequestsTable(data: []),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestsTable extends StatelessWidget {
  final List data;
  const RequestsTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              'dateTitle'.tr,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'subjetTitle'.tr,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'writerTitle'.tr,
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
          ...allNotificationDetail
              .map(
                (e) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(e.date)),
                    DataCell(Text(e.subject)),
                    DataCell(Text(e.writerName)),
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
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
