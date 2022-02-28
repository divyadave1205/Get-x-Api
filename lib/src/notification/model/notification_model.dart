class Notification {
  final String subject;
  final String date;
  final String writerName;

  Notification(
      {required this.subject, required this.date, required this.writerName});
}

final allNotificationDetail = <Notification>[];
