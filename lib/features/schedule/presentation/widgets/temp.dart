import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/features/schedule/presentation/widgets/buttons.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    List data = ["netflix", "crunchyroll", "crunchyroll", "netflix"];
    return Padding(
      padding: EdgeInsets.only(left: 4.w, top: 3.h, right: 4.w),
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
                      "https://img.animeschedule.net/production/assets/public/img/anime/jpg/default/dungeon-meshi-4c1c47673a.jpg",
                      width: 28.w,
                    ),
                  ),
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
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      "Delicious in Dungeon",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "EP 21/23",
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
                        "Monday - 12:00 AM WIB",
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Countdown: ",
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "1 Hours, 30 Min",
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
                            data.length,
                            (index) => Container(
                                height: 3.5.h,
                                width: 28.w,
                                margin: EdgeInsets.only(top: 1.h, right: 1.w),
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                decoration: BoxDecoration(
                                    color: (data[index] == "netflix")
                                        ? AppColors.netflixColor
                                        : AppColors.crunchyrollColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/${data[index]}.png",
                                    color: AppColors.secondaryColor,
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
    );
  }
}
