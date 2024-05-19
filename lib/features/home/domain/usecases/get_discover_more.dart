import 'dart:developer';

import 'package:tamago/features/home/domain/entities/discover_more_entity.dart';
import 'package:tamago/features/home/domain/usecases/insert_discover_more.dart';

class GetDiscoverMore {
  Future<List<DiscoverMoreEntity>> call() async {
    final anime = await InsertDiscoverMore().insertImagesAllGenre();
    log(anime.length.toString());
    return anime;
  }
}
