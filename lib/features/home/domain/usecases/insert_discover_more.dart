import 'dart:math';
import 'dart:developer' as dev;

import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/entities/discover_more_entity.dart';
import 'package:tamago/features/home/domain/repositories/anime_genre_repository.dart';

class InsertDiscoverMore {
  List<DiscoverMoreEntity> insertAllGenre(List<String> genres) {
    List<DiscoverMoreEntity> discoverMoreList = [];
    for (String genre in genres) {
      DiscoverMoreEntity discoverMore = DiscoverMoreEntity(
        genre: genre,
      );
      discoverMoreList.add(discoverMore);
    }
    return discoverMoreList;
  }

  Future<List<DiscoverMoreEntity>> insertImagesAllGenre() async {
    final genre =
        insertAllGenre(["Action", "Mecha", "Romance", "Fantasy", "Comedy"]);

    Random random = Random();

    List<int> allNumbers = List<int>.generate(12, (index) => index);
    allNumbers.shuffle();
    final numbers = allNumbers.sublist(0);

    dev.log(numbers.toString());

    for (int i = 0; i < genre.length; i++) {
      final animeFilterByGenre = await getIt
          .get<AnimeGenreRepository>()
          .getAnimeBasedOnGenre(genre[i].genre, random.nextInt(4));

      genre[i].imageRoute_1 = animeFilterByGenre[numbers[0]].imageVersionRoute;
      genre[i].imageRoute_2 = animeFilterByGenre[numbers[1]].imageVersionRoute;
      genre[i].imageRoute_3 = animeFilterByGenre[numbers[2]].imageVersionRoute;
      genre[i].imageRoute_4 = animeFilterByGenre[numbers[3]].imageVersionRoute;
    }
    return genre;
  }
}
