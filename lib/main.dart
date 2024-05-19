import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/bottom_nav.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/schedule/presentation/bloc/schedule_bloc.dart';

void main() {
  configure();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ScheduleBloc>(
              create: (context) => ScheduleBloc(),
            ),
          ],
          child: MaterialApp(
              theme: ThemeData(
                  scaffoldBackgroundColor: AppColors.backgroundColor,
                  fontFamily: 'Manrope'),
              home: const BottomNav()),
        );
      },
    );
  }
}
