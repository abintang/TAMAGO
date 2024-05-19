import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tamago/core/constants/app_colors.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 34.h,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 4.w),
              width: 42.w,
              height: 34.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColors.cardOutlineColor, width: 1)),
              child: Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.cardBackgroundColor,
                    highlightColor: AppColors.primaryColor.withOpacity(0.2),
                    child: Container(
                      height: 21.h,
                      margin: EdgeInsets.only(bottom: 1.h),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: AppColors.cardBackgroundColor,
                    highlightColor: AppColors.primaryColor.withOpacity(0.2),
                    child: Container(
                      height: 4.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.cardBackgroundColor),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: AppColors.cardBackgroundColor,
                    highlightColor: AppColors.primaryColor.withOpacity(0.2),
                    child: Container(
                      height: 3.5.h,
                      margin: EdgeInsets.only(top: 1.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.cardBackgroundColor),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CardLoadingDiscoverMore extends StatelessWidget {
  const CardLoadingDiscoverMore({super.key});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
        maxHeight: 24.5.h,
        child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 4.w, bottom: 2.h),
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
                        Shimmer.fromColors(
                          baseColor: AppColors.cardBackgroundColor,
                          highlightColor:
                              AppColors.primaryColor.withOpacity(0.2),
                          child: Container(
                            width: 17.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.cardBackgroundColor,
                          highlightColor:
                              AppColors.primaryColor.withOpacity(0.2),
                          child: Container(
                            width: 17.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                          baseColor: AppColors.cardBackgroundColor,
                          highlightColor:
                              AppColors.primaryColor.withOpacity(0.2),
                          child: Container(
                            width: 17.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor.withOpacity(0.8),
                                  AppColors.primaryColor.withOpacity(0.0),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.cardBackgroundColor,
                          highlightColor:
                              AppColors.primaryColor.withOpacity(0.2),
                          child: Container(
                            width: 17.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor.withOpacity(0.8),
                                  AppColors.primaryColor.withOpacity(0.0),
                                ],
                                stops: const [0.0, 0.5, 1.0],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Shimmer.fromColors(
                      baseColor: AppColors.cardBackgroundColor,
                      highlightColor: AppColors.primaryColor.withOpacity(0.2),
                      child: Container(
                        height: 3.5.h,
                        margin: EdgeInsets.only(top: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.cardBackgroundColor),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
