import 'dart:convert';
import 'dart:developer';
import 'package:tamago/features/home/data/models/anime_recommendations_model.dart';
import 'package:tamago/core/constants/constants.dart';
import 'package:http/http.dart' as http;

abstract class AnimeGenreRemote {
  Future<List<AnimeRecommendations>> getAnime(String genre, int page);
}

class AnimeGenreRemoteImpl implements AnimeGenreRemote {
  @override
  Future<List<AnimeRecommendations>> getAnime(String genre, int page) async {
    String endpoint = "anime?genres=${genre.toLowerCase()}&page=$page";
    final response = await http.get(Uri.parse(Constants.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['anime'];
      final List<AnimeRecommendations> anime =
          data.map((json) => AnimeRecommendations.fromJson(json)).toList();
      log(anime.length.toString());
      return anime;
    } else {
      throw Exception('Failed to load');
    }
  }
}
