import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/data/models/sub_model.dart';
import 'package:tamago/features/home/domain/usecases/get_ellipsize_string.dart';
import 'package:tamago/features/home/domain/usecases/get_splitted_string.dart';

class AnimeUpcomingEntity {
  String route;
  String title;
  String premier;
  String month;
  int year;
  String jpnTime;
  String imageVersionRoute;
  NamesModel names;
  @JsonKey(includeFromJson: false)
  String titleShown;
  @JsonKey(includeFromJson: false)
  String dateShown;

  AnimeUpcomingEntity(
      {required this.route,
      required this.title,
      required this.premier,
      required this.month,
      required this.year,
      required this.jpnTime,
      required this.imageVersionRoute,
      required this.names})
      : titleShown = (names.english == "")
            ? getIt.get<GetEllipsizeString>().ellipsizeString(title, 35)
            : getIt
                .get<GetEllipsizeString>()
                .ellipsizeString(names.english, 35),
        dateShown = (month == "" && year == 0)
            ? "Unknown"
            : "${getIt.get<GetSplittedString>().getDate(premier)} $month $year";
}
