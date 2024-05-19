import 'package:flutter/material.dart';

abstract class NotificationsState {}

class InitialState extends NotificationsState {}

class GetStatusNotifications extends NotificationsState {
  final IconData icons;
  final Color backgroundColor;
  final Color iconColor;

  GetStatusNotifications(
      {required this.icons,
      required this.backgroundColor,
      required this.iconColor});
}
