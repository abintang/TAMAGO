import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/data/models/sub_model.dart';
import 'package:tamago/features/home/domain/usecases/get_ellipsize_string.dart';

class AnimeRecommendationsEntity {
  String route;
  String title;
  int episodes;
  String status;
  String imageVersionRoute;
  NamesModel names;
  @JsonKey(includeFromJson: false)
  String titleShown;

  AnimeRecommendationsEntity(
      {required this.route,
      required this.title,
      required this.status,
      int? episodes,
      required this.imageVersionRoute,
      required this.names})
      : episodes = episodes ?? 0,
        titleShown = (names.english == "")
            ? getIt.get<GetEllipsizeString>().ellipsizeString(title, 35)
            : getIt
                .get<GetEllipsizeString>()
                .ellipsizeString(names.english, 35);
}
