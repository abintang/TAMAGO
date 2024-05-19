import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/usecases/get_splitted_string.dart';
import 'package:tamago/features/schedule/data/models/sub_model.dart';

class AnimeScheduleEntity {
  String route;
  String title;
  String english;
  String episodeDate;
  int episodeNumber;
  int episodes;
  String imageVersionRoute;
  bool donghua;
  String airType;
  @JsonKey(includeIfNull: true)
  StreamsModel? streams;
  @JsonKey(includeFromJson: false)
  String episodeFormat;
  @JsonKey(includeFromJson: false)
  String scheduleDateFormat;
  @JsonKey(includeFromJson: false)
  String countdownDateFormat;
  AnimeScheduleEntity(
      {required this.route,
      required this.title,
      required this.english,
      required this.episodeDate,
      required this.episodeNumber,
      required this.episodes,
      required this.imageVersionRoute,
      required this.donghua,
      required this.airType,
      required this.streams})
      : episodeFormat =
            '$episodeNumber/${(episodes == 0) ? '??' : episodes.toString()}',
        scheduleDateFormat =
            '${DateFormat('EEEE').format(DateTime(getIt.get<GetSplittedString>().getYear(episodeDate), getIt.get<GetSplittedString>().getMonth(episodeDate), getIt.get<GetSplittedString>().getDay(episodeDate)))} - ${getIt.get<GetSplittedString>().getSplitEpisodeDate(episodeDate)} WIB',
        countdownDateFormat =
            '${getIt.get<GetSplittedString>().getSplitEpisodeYearMonthDay(episodeDate)} ${getIt.get<GetSplittedString>().getSplitEpisodeDate(episodeDate)}:00';
}
