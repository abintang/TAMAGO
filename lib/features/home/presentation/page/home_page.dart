import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/features/home/presentation/widgets/anime_recommendations_card.dart';
import 'package:tamago/features/home/presentation/widgets/anime_today_card.dart';
import 'package:tamago/features/home/presentation/widgets/anime_upcoming_section.dart';
import 'package:tamago/features/home/presentation/widgets/buttons.dart';
import 'package:tamago/features/home/presentation/widgets/discover_more_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              textButton: "Anime Ranking",
              iconButton: Icons.analytics,
              onTap: () {},
            ),
            CustomButton(
              textButton: "All Anime",
              iconButton: Icons.ondemand_video,
              onTap: () {},
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              textButton: "Seasonal Anime",
              iconButton: Icons.sunny_snowing,
              onTap: () {},
            ),
            CustomButton(
              textButton: "Random Anime",
              iconButton: Icons.quiz,
              onTap: () {},
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
        child: Text(
          "Today",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      const AnimeTodayCard(),
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recommendations From The Last Season",
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
                  size: 6.w,
                ))
          ],
        ),
      ),
      const AnimeRecommendationsCard(),
      const AnimeUpcomingSection(),
      const DiscoverMoreSection()
    ])));
  }
}
