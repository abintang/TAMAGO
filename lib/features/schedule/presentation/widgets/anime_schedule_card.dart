import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/constants.dart';
import 'package:tamago/features/schedule/domain/entities/streams_entity.dart';
import 'package:tamago/features/schedule/presentation/bloc/event/schedule_events.dart';
import 'package:tamago/features/schedule/presentation/bloc/notifications_bloc.dart';
import 'package:tamago/features/schedule/presentation/bloc/state/notifications_state.dart';
import 'package:tamago/features/schedule/presentation/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../../../../core/constants/app_colors.dart';

class AnimeScheduleCard extends StatelessWidget {
  final int index;
  final String urlImage;
  final String animeName;
  final String episode;
  final String scheduleDayTime;
  final String countdownDate;
  final List<StreamsEntity> streams;
  final VoidCallback onTapNotifications;

  const AnimeScheduleCard(
      {super.key,
      required this.index,
      required this.urlImage,
      required this.animeName,
      required this.episode,
      required this.scheduleDayTime,
      required this.countdownDate,
      required this.streams,
      required this.onTapNotifications});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsBloc>(
      create: (context) => NotificationsBloc()
        ..add(OnClickedNotifications(routeAnime: index.toString())),
      child: Padding(
        padding:
            EdgeInsets.only(left: 4.w, top: (index == 0) ? 0 : 3.h, right: 4.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        Constants.imageRoute + urlImage,
                        width: 28.w,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<NotificationsBloc, NotificationsState>(
                        builder: (context, state) {
                      if (state is GetStatusNotifications) {
                        return CustomIconButton(
                            iconButton: state.icons,
                            onTap: () {
                              context.read<NotificationsBloc>().add(
                                  OnClickedNotifications(
                                      routeAnime: index.toString(),
                                      status: true));
                            },
                            backgroundColor: state.backgroundColor,
                            iconColor: state.iconColor,
                            width: 15);
                      } else {
                        return SizedBox();
                      }
                    })
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: Text(
                        animeName,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "EP $episode",
                          style: TextStyle(
                              color: AppColors.fontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 4,
                            right: 4,
                          ),
                          width: 1,
                          height: 1.h,
                          color: AppColors.secondaryColor,
                        ),
                        Text(
                          scheduleDayTime,
                          style: TextStyle(
                              color: AppColors.fontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                      height: 2,
                      width: 60.w,
                      color: AppColors.cardOutlineColor,
                    ),
                    Text(
                      "Countdown: ",
                      style: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TimerCountdown(
                      endTime: DateTime.parse(countdownDate),
                      spacerWidth: 2,
                      descriptionTextStyle: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      timeTextStyle: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                      height: 2,
                      width: 60.w,
                      color: AppColors.cardOutlineColor,
                    ),
                    Text(
                      "Available at: ",
                      style: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 60.w,
                      child: Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(
                              streams.length,
                              (index) => Container(
                                  height: 3.5.h,
                                  width: 28.w,
                                  margin: EdgeInsets.only(top: 1.h, right: 1.w),
                                  decoration: BoxDecoration(
                                      color: streams[index].colorPallete,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        launchAnotherApp(
                                            streams[index].urlStreams);
                                      },
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/${streams[index].nameStreams}.png",
                                          color: AppColors.secondaryColor,
                                          width: streams[index].sizeImage.w,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  )))),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 2,
              color: AppColors.cardOutlineColor,
            ),
          ],
        ),
      ),
    );
  }
}

void launchAnotherApp(String? url) async {
  if (!await launchUrl(Uri.parse(url!), mode: LaunchMode.externalApplication)) {
    throw 'Could not launch ';
  }
}
