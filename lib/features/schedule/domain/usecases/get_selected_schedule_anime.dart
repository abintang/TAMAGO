import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/schedule/domain/entities/anime_schedule_entity.dart';
import 'package:tamago/features/schedule/domain/repositories/anime_schedule_repository.dart';
import 'package:tamago/features/schedule/domain/usecases/get_selected_date.dart';

class GetSelectedScheduleAnime {
  Future<List<AnimeScheduleEntity>> call(String selectedDate) async {
    final getSelectedDate = GetSelectedDate(selectedDate: selectedDate);
    final anime = await getIt.get<AnimeScheduleRepository>().getAnimeSchedule(
        getSelectedDate.getYear().toString(), getSelectedDate.getWeek());

    final filteredAnime = anime
        .where((item) =>
            item.episodeDate.contains(getSelectedDate.selectedDateFormat()) &&
            !item.donghua &&
            item.airType.contains('sub'))
        .toList();

    return filteredAnime;
  }
}
