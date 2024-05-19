import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/usecases/get_ellipsize_string.dart';
import 'package:tamago/features/home/domain/usecases/get_splitted_string.dart';

class AnimeTodayEntity {
  String route;
  String title;
  String english;
  String episodeDate;
  int episodeNumber;
  String imageVersionRoute;
  bool donghua;
  String airType;
  @JsonKey(includeFromJson: false)
  String episodeDateTime;
  @JsonKey(includeFromJson: false)
  String ellipsizeTitle;

  AnimeTodayEntity({
    required this.route,
    required this.title,
    required this.english,
    required this.episodeDate,
    required this.episodeNumber,
    required this.imageVersionRoute,
    required this.donghua,
    required this.airType,
  })  : episodeDateTime =
            getIt.get<GetSplittedString>().getSplitEpisodeDate(episodeDate),
        ellipsizeTitle =
            getIt.get<GetEllipsizeString>().ellipsizeString(english, 35);
}
