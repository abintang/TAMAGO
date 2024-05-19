import 'dart:convert';
import 'dart:developer';
import 'package:tamago/features/home/data/models/anime_recommendations_model.dart';
import 'package:tamago/core/constants/constants.dart';
import 'package:http/http.dart' as http;

abstract class AnimeRecommendationsRemote {
  Future<List<AnimeRecommendations>> getAnime(String year, String seasons);
}

class AnimeRecommendationsRemoteImpl implements AnimeRecommendationsRemote {
  @override
  Future<List<AnimeRecommendations>> getAnime(
      String year, String seasons) async {
    String endpoint =
        "anime?st=score&years=$year&seasons=$seasons&mt=all&media-types-exclude=ona-chinese&media-types-exclude=tv-chinese&media-types-exclude=movie-chinese";
    final response = await http.get(Uri.parse(Constants.baseUrl + endpoint));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['anime'];
      final List<AnimeRecommendations> anime =
          data.map((json) => AnimeRecommendations.fromJson(json)).toList();

      return anime;
    } else {
      throw Exception('Failed to load');
    }
  }
}
