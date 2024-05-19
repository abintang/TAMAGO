import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconButton;
  final VoidCallback onTap;
  final double width;
  final Color iconColor;
  final Color backgroundColor;
  final Color outlineColor;

  const CustomIconButton(
      {super.key,
      required this.iconButton,
      required this.onTap,
      required this.width,
      Color? iconColor,
      Color? backgroundColor,
      Color? outlineColor})
      : iconColor = iconColor ?? AppColors.primaryColor,
        backgroundColor = backgroundColor ?? AppColors.cardBackgroundColor,
        outlineColor = outlineColor ?? AppColors.cardOutlineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 4.h,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: outlineColor, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Center(
            child: Icon(
              iconButton,
              color: iconColor,
              size: 5.w,
            ),
          ),
        ),
      ),
    );
  }
}
