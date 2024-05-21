abstract class ScheduleEvent {}

class InitialScheduleAnime extends ScheduleEvent {}

class LoadScheduleAnime extends ScheduleEvent {
  final String selectedDate;

  LoadScheduleAnime({required this.selectedDate});
}

class OnClickedNotifications extends ScheduleEvent {
  final String routeAnime;
  bool? status;

  OnClickedNotifications({required this.routeAnime, bool? status})
      : status = status ?? false;
}

class OnClickedStreams extends ScheduleEvent {
  String? routeStreams;

  OnClickedStreams({String? routeStreams}) : routeStreams = routeStreams ?? "";
}
