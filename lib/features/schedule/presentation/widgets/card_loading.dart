import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/features/schedule/presentation/widgets/buttons.dart';

class CardLoading extends StatelessWidget {
  final int index;
  const CardLoading({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Shimmer.fromColors(
                      baseColor: AppColors.cardBackgroundColor,
                      highlightColor: AppColors.primaryColor,
                      child: Container(
                        width: 28.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomIconButton(
                      iconButton: Icons.notification_add,
                      onTap: () {},
                      width: 15)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                      baseColor: AppColors.cardBackgroundColor,
                      highlightColor: AppColors.primaryColor,
                      child: Container(
                        width: 60.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                  Shimmer.fromColors(
                      baseColor: AppColors.cardBackgroundColor,
                      highlightColor: AppColors.primaryColor,
                      child: Container(
                        width: 60.w,
                        height: 1.h,
                        margin: EdgeInsets.only(top: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                    height: 2,
                    width: 60.w,
                    color: AppColors.cardOutlineColor,
                  ),
                  Shimmer.fromColors(
                      baseColor: AppColors.cardBackgroundColor,
                      highlightColor: AppColors.primaryColor,
                      child: Container(
                        width: 60.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                    height: 2,
                    width: 60.w,
                    color: AppColors.cardOutlineColor,
                  ),
                  Shimmer.fromColors(
                      baseColor: AppColors.cardBackgroundColor,
                      highlightColor: AppColors.primaryColor,
                      child: Container(
                        width: 60.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)),
                      )),
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
    );
  }
}
