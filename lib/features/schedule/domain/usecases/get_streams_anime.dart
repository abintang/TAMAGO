import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/features/schedule/domain/entities/anime_schedule_entity.dart';
import 'package:tamago/features/schedule/domain/entities/streams_entity.dart';

class GetStreamsAnime {
  List<StreamsEntity> insertStreamsAnime(List<AnimeScheduleEntity> animes) {
    List<StreamsEntity> streamsList = [];

    for (var anime in animes) {
      if (anime.streams != null) {
        if (anime.streams?.netflix != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'netflix',
            urlStreams: anime.streams!.netflix,
            colorPallete: AppColors.netflixColor,
            sizeImage: 18,
          ));
        }
        if (anime.streams?.amazon != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'amazon',
            urlStreams: anime.streams!.amazon,
            colorPallete: AppColors.amazonColor,
            sizeImage: 16,
          ));
        }
        if (anime.streams?.crunchyroll != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'crunchyroll',
            urlStreams: anime.streams!.crunchyroll,
            colorPallete: AppColors.crunchyrollColor,
            sizeImage: 25,
          ));
        }
        if (anime.streams?.youtube != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'youtube',
            urlStreams: anime.streams!.youtube,
            colorPallete: AppColors.youtubeColor,
            sizeImage: 20,
          ));
        }
        if (anime.streams?.hidive != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'hidive',
            urlStreams: anime.streams!.hidive,
            colorPallete: AppColors.hidiveColor,
            sizeImage: 15,
          ));
        }
        if (anime.streams?.hulu != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'hulu',
            urlStreams: anime.streams!.hulu,
            colorPallete: AppColors.huluColor,
            sizeImage: 16,
          ));
        }
        if (anime.streams?.funimation != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'funimation',
            urlStreams: anime.streams!.funimation,
            colorPallete: AppColors.funimationColor,
            sizeImage: 22,
          ));
        }

        if (anime.streams?.wakanim != null) {
          streamsList.add(StreamsEntity(
            route: anime.route,
            nameStreams: 'wakanim',
            urlStreams: anime.streams!.wakanim,
            colorPallete: AppColors.wakanimColor,
            sizeImage: 20,
          ));
        }
      }
    }
    return streamsList;
  }

  List<StreamsEntity> getStreamsFiltered(
      String route, List<StreamsEntity> streams) {
    var streamsList =
        streams.where((item) => item.route.contains(route)).toList();

    return streamsList;
  }
}
