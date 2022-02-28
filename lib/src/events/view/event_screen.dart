import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/events/controller/event_screen_controller.dart';
import 'package:mbo_admin_pannel/src/events/model/event_model.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_drawer.dart';

import 'edit_event_screen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final EventScreenController _eventScreenController =
      Get.find(tag: EventScreenController().toString());
  @override
  void initState() {
    setState(() {});
    _eventScreenController.getEventList();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "EventTitleText".tr,
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
                          Get.toNamed(RouteUtilities.createNewEventScreen);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: ColorUtilities.blackColor,
                          size: 25,
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                GetBuilder<EventScreenController>(
                    init: _eventScreenController,
                    builder: (_) {
                      return _eventScreenController.getEventListModel == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : buildRequestTable(
                              data: _eventScreenController
                                  .getEventListModel!.data);
                    })
              ],
            )),
      ),
    );
  }

  Widget buildRequestTable({required List<Datum> data}) {
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
          ...data
              .map((e) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(e.date)),
                      DataCell(Text(e.endTime)),
                      DataCell(Text(e.writer)),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(RouteUtilities.editEventScreen,
                                      arguments: EditEventArgument(member: e));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: ColorUtilities.blueColor,
                                )),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                _eventScreenController.deleteEvent(
                                    eventId: e.startTime);
                              },
                            ),
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
