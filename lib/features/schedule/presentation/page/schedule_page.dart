import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/schedule/domain/usecases/get_streams_anime.dart';
import 'package:tamago/features/schedule/presentation/bloc/event/schedule_events.dart';
import 'package:tamago/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:tamago/features/schedule/presentation/bloc/state/schedule_state.dart';
import 'package:tamago/features/schedule/presentation/widgets/anime_schedule_card.dart';
import 'package:tamago/features/schedule/presentation/widgets/card_loading.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    context.read<ScheduleBloc>().add(InitialScheduleAnime());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Select a Date :",
                  style: TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.h),
            child: DatePicker(
              DateTime.now(),
              height: 12.h,
              daysCount: 7,
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primaryColor,
              selectedTextColor: AppColors.secondaryColor,
              monthTextStyle:
                  const TextStyle(color: AppColors.fontColorWithOpacity),
              dayTextStyle:
                  const TextStyle(color: AppColors.fontColorWithOpacity),
              dateTextStyle:
                  const TextStyle(color: AppColors.fontColorWithOpacity),
              onDateChange: (date) {
                context
                    .read<ScheduleBloc>()
                    .add(LoadScheduleAnime(selectedDate: date.toString()));
              },
            ),
          ),
          BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              if (state is GetScheduleAnimeSuccess) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.scheduleAnime.length,
                      itemBuilder: (context, index) {
                        log('sekarang ${DateTime.now()}  -  ${state.scheduleAnime[index].episodeDate}');
                        var streamsList = getIt
                            .get<GetStreamsAnime>()
                            .getStreamsFiltered(
                                state.scheduleAnime[index].route,
                                state.streamsAnime);
                        return AnimeScheduleCard(
                          index: index,
                          urlImage:
                              state.scheduleAnime[index].imageVersionRoute,
                          animeName: state.scheduleAnime[index].english,
                          episode: state.scheduleAnime[index].episodeFormat,
                          scheduleDayTime:
                              state.scheduleAnime[index].scheduleDateFormat,
                          countdownDate:
                              state.scheduleAnime[index].countdownDateFormat,
                          streams: streamsList,
                          onTapNotifications: () {},
                        );
                      }),
                );
              } else if (state is LoadingScheduleAnime) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CardLoading(index: index);
                        }));
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
