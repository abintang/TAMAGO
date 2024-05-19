import 'dart:convert';
import 'dart:developer';

import 'package:tamago/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:tamago/features/schedule/data/models/anime_schedule_model.dart';

abstract class AnimeScheduleRemote {
  Future<List<AnimeScheduleModel>> getAnimeSchedule(String year, String week);
}

class AnimeScheduleRemoteImpl implements AnimeScheduleRemote {
  @override
  Future<List<AnimeScheduleModel>> getAnimeSchedule(
      String year, String week) async {
    String endpoint = "/timetables/all?year=$year&week=$week&tz=Asia/Jakarta";
    final response =
        await http.get(Uri.parse(Constants.baseUrl + endpoint), headers: {
      "Authorization": "Bearer ${Constants.accessToken}",
    });

    if (response.statusCode == 200) {
      log('minggu ke $week');
      final List<dynamic> data = json.decode(response.body);
      final List<AnimeScheduleModel> anime =
          data.map((json) => AnimeScheduleModel.fromJson(json)).toList();

      return anime;
    } else {
      throw Exception('Failed to load');
    }
  }
}
