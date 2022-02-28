import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_button.dart';
import 'package:mbo_admin_pannel/widget/custom_drawer.dart';
import 'package:mbo_admin_pannel/widget/custom_textfield.dart';

// ignore: must_be_immutable
class MembershipScreen extends StatelessWidget {
  MembershipScreen({Key? key}) : super(key: key);
  TextEditingController addPriceTextController = TextEditingController();
  TextEditingController srmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "membershipTitleText".tr,
          )),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomButton(
                        onCustomButtonTap: () {},
                        title: 'decidePriceTitleText'.tr,
                        color: Colors.blue.shade50,
                        textColor: Colors.black,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                color: Colors.grey.shade100,
                                textColor: Colors.black,
                                onCustomButtonTap: () {},
                                title: "didTitleText".tr),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('SRM'),
                          ),
                          Expanded(
                            child: CustomTextField(
                                titleText: '', controller: srmController),
                          ),
                        ],
                      ),
                      CustomTextField(
                          titleText: 'addPriceHereTitleText'.tr,
                          controller: addPriceTextController),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                color: Colors.green,
                                onCustomButtonTap: () {},
                                title: "didTitleText".tr),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomButton(
                                color: Colors.red,
                                onCustomButtonTap: () {},
                                title: "eliminateTitleText".tr),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
