import 'dart:convert';
import 'dart:developer';

import 'package:tamago/core/constants/constants.dart';
import 'package:tamago/features/home/data/models/anime_today_model.dart';
import 'package:http/http.dart' as http;

abstract class AnimeTodayRemote {
  Future<List<AnimeTodayModel>> getAnimeToday(String year, String week);
}

class AnimeTodayRemoteImpl implements AnimeTodayRemote {
  @override
  Future<List<AnimeTodayModel>> getAnimeToday(String year, String week) async {
    String endpoint = "/timetables/all?year=$year&week=$week&tz=Asia/Jakarta";
    final response =
        await http.get(Uri.parse(Constants.baseUrl + endpoint), headers: {
      "Authorization": "Bearer ${Constants.accessToken}",
    });
    if (response.statusCode == 200) {
      log(response.body);
      final List<dynamic> data = json.decode(response.body);
      final List<AnimeTodayModel> anime =
          data.map((json) => AnimeTodayModel.fromJson(json)).toList();

      return anime;
    } else {
      throw Exception('Failed to load');
    }
  }
}
