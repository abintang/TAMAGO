import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/core/constants/constants.dart';
import 'package:tamago/features/home/presentation/bloc/events/home_event.dart';
import 'package:tamago/features/home/presentation/bloc/home_bloc.dart';
import 'package:tamago/features/home/presentation/bloc/states/home_state.dart';
import 'package:tamago/features/home/presentation/widgets/card_loading.dart';

class DiscoverMoreSection extends StatelessWidget {
  const DiscoverMoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
          child: Text(
            "Discover More",
            style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(LoadDiscoverMoreContent()),
            child: const DiscoverMoreCard())
      ],
    );
  }
}

class DiscoverMoreCard extends StatelessWidget {
  const DiscoverMoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetDiscoverMoreSuccess) {
          return LimitedBox(
              maxHeight: 24.5.h,
              child: ListView.builder(
                  itemCount: state.discoverMoreContent.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    double rightMargin = 0;
                    if (state.discoverMoreContent.length == (index + 1)) {
                      rightMargin = 4;
                    }
                    return Container(
                      margin: EdgeInsets.only(
                          left: 4.w, bottom: 2.h, right: rightMargin),
                      width: 42.w,
                      height: 24.5.h,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: AppColors.cardBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: AppColors.cardOutlineColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  Constants.imageRoute +
                                      state.discoverMoreContent[index]
                                          .imageRoute_1,
                                  width: 17.w,
                                  height: 8.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  Constants.imageRoute +
                                      state.discoverMoreContent[index]
                                          .imageRoute_2,
                                  width: 17.w,
                                  height: 8.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    Constants.imageRoute +
                                        state.discoverMoreContent[index]
                                            .imageRoute_3,
                                    width: 17.w,
                                    height: 8.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 17.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        AppColors.cardBackgroundColor,
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ]),
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    Constants.imageRoute +
                                        state.discoverMoreContent[index]
                                            .imageRoute_4,
                                    width: 17.w,
                                    height: 8.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 17.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        AppColors.cardBackgroundColor,
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.discoverMoreContent[index].genre,
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.secondaryColor,
                                    size: 5.w,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    );
                  }));
        } else if (state is LoadingDiscoverMore) {
          return const CardLoadingDiscoverMore();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
