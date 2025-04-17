class UserMessageModel {
  final String title;
  final String subtitle;
  final String userImage;
  final num messageCount;
  final String dateTime;

  UserMessageModel({
    required this.title,
    required this.subtitle,
    required this.messageCount,
    required this.userImage,
    required this.dateTime,
  });
}
