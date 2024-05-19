import 'dart:convert';

import 'package:tamago/core/constants/constants.dart';
import 'package:tamago/features/home/data/models/anime_upcoming_model.dart';
import 'package:http/http.dart' as http;

abstract class AnimeUpcomingRemote {
  Future<List<AnimeUpcomingModel>> getAnimeUpcoming();
}

class AnimeUpcomingRemoteImpl implements AnimeUpcomingRemote {
  @override
  Future<List<AnimeUpcomingModel>> getAnimeUpcoming() async {
    String endpoint = "/anime?airing-statuses=upcoming&st=popularity";
    final response = await http.get(Uri.parse(Constants.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['anime'];
      final List<AnimeUpcomingModel> anime =
          data.map((json) => AnimeUpcomingModel.fromJson(json)).toList();

      return anime;
    } else {
      throw Exception('Failed to load');
    }
  }
}
