import 'dart:ui';

/// A model class for storing status item properties
class StatusItem {
  final String title;
  final String subtitle;
  final String count;
  final VoidCallback onTap;
  final Color countTextColor;
  final Color countBgColor;

  StatusItem({
    required this.title,
    required this.subtitle,
    required this.count,
    required this.onTap,
    required this.countTextColor,
    required this.countBgColor,
  });
}

class PendingStatusItemModel {
  final String day;
  final String time;
  final String title;
  final String subtitle;
  final String userImage;
  final String userName;

  PendingStatusItemModel({
    required this.title,
    required this.subtitle,
    required this.userImage,
    required this.userName,
    required this.time,
    required this.day,
  });
}

class OnGoingStatusItemModel {
  final String paymentStatus;
  final String mileStoneExpiry;
  final String title;
  final String title2;
  final String subtitle;
  final String userImage;
  final String userName;

  OnGoingStatusItemModel({
    required this.title,
    required this.title2,
    required this.subtitle,
    required this.userImage,
    required this.userName,
    required this.paymentStatus,
    required this.mileStoneExpiry,
  });
}
class CanceledStatusItemModel {
  final String paymentStatus;
  final String mileStoneExpiry;
  final String title;
  final String title2;
  final String subtitle;
  final String userImage;
  final String userName;

  CanceledStatusItemModel({
    required this.title,
    required this.title2,
    required this.subtitle,
    required this.userImage,
    required this.userName,
    required this.paymentStatus,
    required this.mileStoneExpiry,
  });
}
class CompletedStatusItemModel {
  final String paymentStatus;
  final String title;
  final String title2;
  final String subtitle;
  final String userImage;
  final String userName;
  final double rating;
  final String userDes;

  CompletedStatusItemModel({
    required this.title,
    required this.title2,
    required this.subtitle,
    required this.userImage,
    required this.userName,
    required this.paymentStatus,
    required this.rating,
    required this.userDes,
  });
}
