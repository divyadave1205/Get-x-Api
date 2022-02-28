/// api link
class APIUtilities {
  static const String baseUrl = "http://mbo.bz/api/mbo";
  static const String auth = "$baseUrl/login-admin";
  static const String getBlog = "$baseUrl/get-blogs";
  static const String getEvent = "$baseUrl/get-events";
  static const String deleteEvent = "$baseUrl/event-delete?event_id=";
  static const String insertEvent = "$baseUrl/event-insert";
  static const String getMemberList = "$baseUrl/get-users";
  static const String getUserDetail = "$baseUrl/get-user-detail?user_id=";
  static const String diApprove = "$baseUrl/disapprove-user";
  static const String addBlog = "$baseUrl/blog-insert";
  static const String editBlog = "$baseUrl/blog-edit";
  static const String deleteBlog = "$baseUrl/blog-delete?blog_id=";
  static const String addEvent = "$baseUrl/event-insert";
  static const String editEvent = "$baseUrl/event-edit";
}
