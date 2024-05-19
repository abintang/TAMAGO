import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/features/favorites/presentation/pages/favorites_page.dart';
import 'package:tamago/features/home/presentation/page/home_page.dart';
import 'package:tamago/features/schedule/presentation/page/schedule_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const SchedulePage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "卵 - TAMAGO",
            style: TextStyle(
                color: AppColors.fontColor, fontWeight: FontWeight.w600),
          ),
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.filter_alt,
              color: AppColors.secondaryColor,
              size: 6.w,
            ),
          ),
          surfaceTintColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 10,
          backgroundColor: AppColors.cardBackgroundColor,
          shadowColor: AppColors.cardOutlineColor,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: AppColors.secondaryColor,
                    size: 6.w,
                  ),
                ))
          ],
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: AppColors.cardBackgroundColor,
          iconSize: 6.w,
          selectedIndex: _currentIndex,
          showElevation: true,
          shadows: const [
            BoxShadow(color: AppColors.cardOutlineColor, blurRadius: 4)
          ],
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            FlashyTabBarItem(
              activeColor: AppColors.secondaryColor,
              inactiveColor: AppColors.secondaryColor.withOpacity(0.5),
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: AppColors.secondaryColor,
              inactiveColor: AppColors.secondaryColor.withOpacity(0.5),
              icon: const Icon(Icons.event),
              title: const Text('Schedule'),
            ),
            FlashyTabBarItem(
              activeColor: AppColors.secondaryColor,
              inactiveColor: AppColors.secondaryColor.withOpacity(0.5),
              icon: const Icon(Icons.notifications_active),
              title: const Text('Notifications'),
            ),
          ],
        ));
  }
}
