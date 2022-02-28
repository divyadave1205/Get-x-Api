import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/src/blog/controller/blog_screen_controller.dart';

import 'package:mbo_admin_pannel/src/blog/view/edit_blog_screen.dart';
import 'package:mbo_admin_pannel/utilities/color_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';
import 'package:mbo_admin_pannel/widget/custom_appbar.dart';
import 'package:mbo_admin_pannel/widget/custom_drawer.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final BlogScreenController _blogScreenController =
      Get.find(tag: BlogScreenController().toString());
  @override
  void initState() {
    _blogScreenController.getBlogList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: CustomAppbar(
            title: "BlogTitleText".tr,
          )),
      drawer: CustomDrawer(),
      body: Padding(
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
                    onPressed: () async {
                      Get.offNamed(RouteUtilities.createNewBlogScreen);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black87,
                      size: 30,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            GetBuilder<BlogScreenController>(
                init: _blogScreenController,
                builder: (_) {
                  if (_blogScreenController.getBlogListModel == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _blogScreenController
                              .getBlogListModel?.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                    '${_blogScreenController.getBlogListModel?.data[index].title}'),
                                subtitle: Text(
                                  '${_blogScreenController.getBlogListModel?.data[index].created.toString()}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                RouteUtilities.editBlogScreen,
                                                arguments: EditBlogArgument(
                                                    memberId:
                                                        _blogScreenController
                                                            .getBlogListModel!
                                                            .data[index]));
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: ColorUtilities.blueColor,
                                          )),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          _blogScreenController.deleteBlog(
                                              blogId: _blogScreenController
                                                  .getBlogListModel!
                                                  .data[index]
                                                  .id);
                                        },
                                      ),
                                    ],
                                  ),
                                ));
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
