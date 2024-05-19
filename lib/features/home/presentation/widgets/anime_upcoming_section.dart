import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/core/constants/constants.dart';
import 'package:tamago/features/home/presentation/bloc/events/home_event.dart';
import 'package:tamago/features/home/presentation/bloc/home_bloc.dart';
import 'package:tamago/features/home/presentation/bloc/states/home_state.dart';
import 'package:tamago/features/home/presentation/widgets/card_loading.dart';

class AnimeUpcomingSection extends StatelessWidget {
  const AnimeUpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Anime",
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColors.secondaryColor,
                    size: 6.w,
                  ))
            ],
          ),
        ),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(LoadUpcomingAnime()),
            child: const AnimeUpcomingCard())
      ],
    );
  }
}

class AnimeUpcomingCard extends StatelessWidget {
  const AnimeUpcomingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetAnimeUpcomingSuccess) {
          return LimitedBox(
            maxHeight: 34.h,
            child: ListView.builder(
                itemCount: state.animeUpcoming.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  double rightMargin = 0;
                  if (state.animeUpcoming.length == (index + 1)) {
                    rightMargin = 4;
                  }

                  return Container(
                    margin: EdgeInsets.only(left: 4.w, right: rightMargin.w),
                    width: 42.w,
                    height: 34.h,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.cardBackgroundColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AppColors.cardOutlineColor, width: 1)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            Constants.imageRoute +
                                state.animeUpcoming[index].imageVersionRoute,
                            height: 21.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 4.5.h,
                          margin: EdgeInsets.only(top: 1.h),
                          child: Center(
                            child: Text(
                              state.animeUpcoming[index].titleShown,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.fontColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp),
                            ),
                          ),
                        ),
                        Container(
                          height: 3.5.h,
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                          margin: EdgeInsets.only(top: 1.h),
                          decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              border:
                                  Border.all(color: AppColors.cardOutlineColor),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              state.animeUpcoming[index].dateShown,
                              style: TextStyle(
                                  color: AppColors.fontColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        } else if (state is LoadingAnimeUpcoming) {
          return const CardLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
