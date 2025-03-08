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