import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/features/schedule/presentation/bloc/event/schedule_events.dart';
import 'package:tamago/features/schedule/presentation/bloc/state/notifications_state.dart';

class NotificationsBloc extends Bloc<ScheduleEvent, NotificationsState> {
  NotificationsBloc() : super(InitialState()) {
    on<OnClickedNotifications>(_onClickedNotiications);
  }

  void _onClickedNotiications(
      OnClickedNotifications event, Emitter<NotificationsState> emit) {
    if (event.status == true) {
      emit(GetStatusNotifications(
          icons: Icons.notifications_active,
          backgroundColor: AppColors.primaryColor,
          iconColor: AppColors.secondaryColor));
    } else {
      emit(GetStatusNotifications(
          icons: Icons.notification_add,
          backgroundColor: AppColors.cardBackgroundColor,
          iconColor: AppColors.primaryColor));
    }
  }
}
