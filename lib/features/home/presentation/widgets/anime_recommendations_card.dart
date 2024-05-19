import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/core/constants/constants.dart';
import 'package:tamago/features/home/presentation/bloc/events/home_event.dart';
import 'package:tamago/features/home/presentation/bloc/home_bloc.dart';
import 'package:tamago/features/home/presentation/bloc/states/home_state.dart';
import 'package:tamago/features/home/presentation/widgets/card_loading.dart';

class AnimeRecommendationsCard extends StatelessWidget {
  const AnimeRecommendationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(LoadRecommendedAnime()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is GetRecommendedAnimeSuccess) {
          return LimitedBox(
            maxHeight: 34.h,
            child: ListView.builder(
                itemCount: state.recommendedAnime.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  double rightMargin = 0;
                  if (state.recommendedAnime.length == (index + 1)) {
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
                                state.recommendedAnime[index].imageVersionRoute,
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
                              state.recommendedAnime[index].titleShown,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.fontColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 3.5.h,
                              width: 16.w,
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              margin: EdgeInsets.only(top: 1.h),
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  border: Border.all(
                                      color: AppColors.cardOutlineColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "${state.recommendedAnime[index].episodes} EPS",
                                  style: TextStyle(
                                      color: AppColors.fontColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              height: 3.5.h,
                              width: 20.w,
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              margin: EdgeInsets.only(top: 1.h),
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  border: Border.all(
                                      color: AppColors.cardOutlineColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  state.recommendedAnime[index].status,
                                  style: TextStyle(
                                      color: AppColors.fontColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          );
        } else if (state is LoadingRecommendedAnime) {
          return const CardLoading();
        } else {
          return const CardLoading();
        }
      }),
    );
  }
}
