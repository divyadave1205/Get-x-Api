import 'package:get/get.dart';
import 'package:mbo_admin_pannel/binding/blog_binding.dart';
import 'package:mbo_admin_pannel/binding/create_event_binding.dart';
import 'package:mbo_admin_pannel/binding/edit_blog_binding.dart';
import 'package:mbo_admin_pannel/binding/edit_event_binding.dart';
import 'package:mbo_admin_pannel/binding/event_binding.dart';
import 'package:mbo_admin_pannel/binding/member_binding.dart';
import 'package:mbo_admin_pannel/binding/member_detaile_binding.dart';
import 'package:mbo_admin_pannel/src/auth/binding/auth_binding.dart';
import 'package:mbo_admin_pannel/src/auth/view/login_screen.dart';
import 'package:mbo_admin_pannel/src/blog/view/blog_screen.dart';
import 'package:mbo_admin_pannel/src/blog/view/create_new_blog_screen.dart';
import 'package:mbo_admin_pannel/src/blog/view/edit_blog_screen.dart';
import 'package:mbo_admin_pannel/src/events/view/create_new_event_screen.dart';
import 'package:mbo_admin_pannel/src/events/view/edit_event_screen.dart';
import 'package:mbo_admin_pannel/src/events/view/event_screen.dart';
import 'package:mbo_admin_pannel/src/member/view/member_detaile_screen.dart';
import 'package:mbo_admin_pannel/src/member/view/member_screen.dart';
import 'package:mbo_admin_pannel/src/membership/membership_screen.dart';
import 'package:mbo_admin_pannel/src/notification/view/notification_screen.dart';
import 'package:mbo_admin_pannel/src/online_chat/view/online_chat_detail_screen.dart';
import 'package:mbo_admin_pannel/src/online_chat/view/online_chat_screen.dart';

import 'package:mbo_admin_pannel/src/splashScreen/view/splash_screen.dart';

class RouteUtilities {
  static const String root = "/";
  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/loginScreen";
  static const String memberScreen = "/memberScreen";
  static const String memberDetailScreen = "/memberDetailScreen";
  static const String membershipScreen = '/membershipScreen';
  static const String blogScreen = "/blogScreen";
  static const String createNewBlogScreen = "/createNewBlogScreen";
  static const String editBlogScreen = "/editBlogScreen";
  static const String eventScreen = "/eventScreen";
  static const String createNewEventScreen = "/createNewEventScreen";
  static const String editEventScreen = "/editEventScreen";
  static const String reportsScreen = "/reportsScreen";
  static const String potentialMemberScreen = "/potentialMemberScreen";
  static const String notificationScreen = "/notificationScreen";
  static const String onlinechatScreen = "/onlinechatScreen";
  static const String onlineChatDetailScreen = "/onlineChatDetailScreen";
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: root,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding(),
      ),
      GetPage(
        name: memberScreen,
        binding: MemberBinding(),
        page: () => const MemberScreen(),
      ),
      GetPage(
          binding: MemberDetailBinding(),
          name: memberDetailScreen,
          page: () {
            ReadMemberDetailArgument args =
                Get.arguments as ReadMemberDetailArgument;
            return MemberDetailScreen(argument: args);
          }),
      GetPage(
        name: membershipScreen,
        page: () => MembershipScreen(),
      ),
      GetPage(
          name: blogScreen,
          page: () => const BlogScreen(),
          binding: BlogBinding()),
      GetPage(
          binding: EditBlogBinding(),
          name: editBlogScreen,
          page: () {
            EditBlogArgument args = Get.arguments as EditBlogArgument;
            return EditBlogScreen(
              argument: args,
            );
          }),
      GetPage(
          name: editEventScreen,
          binding: EditEventBinding(),
          page: () {
            EditEventArgument args = Get.arguments as EditEventArgument;
            return EditEventScreen(argument: args);
          }),
      GetPage(name: createNewBlogScreen, page: () => CreateNewBlogScreen()),
      GetPage(
        name: eventScreen,
        binding: EventBinding(),
        page: () => const EventScreen(),
      ),
      GetPage(
          name: createNewEventScreen,
          binding: CreateNewEventBinding(),
          page: () => CreateNewEventScreen()),
      GetPage(
        name: notificationScreen,
        page: () => const NotificationScreen(),
      ),
      // GetPage(
      //   name: potentialMemberScreen,
      //   page: () => MemberScreen(),
      // ),
      GetPage(
        name: onlinechatScreen,
        page: () => OnlineChatScreen(),
      ),
      GetPage(
        name: onlineChatDetailScreen,
        page: () => OnlineChatDetailScreen(),
      ),
    ];
  }
}
