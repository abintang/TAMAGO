import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tamago/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final IconData iconButton;
  final VoidCallback onTap;
  final double width;
  final Color iconColor;
  final Color textColor;
  final Color backgroundColor;
  final Color outlineColor;

  const CustomButton(
      {super.key,
      required this.textButton,
      required this.iconButton,
      required this.onTap,
      double? width,
      Color? iconColor,
      Color? textColor,
      Color? backgroundColor,
      Color? outlineColor})
      : width = width ?? 44,
        iconColor = iconColor ?? AppColors.primaryColor,
        textColor = textColor ?? AppColors.secondaryColor,
        backgroundColor = backgroundColor ?? AppColors.cardBackgroundColor,
        outlineColor = outlineColor ?? AppColors.cardOutlineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 5.5.h,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconButton,
                  color: iconColor,
                  size: 6.w,
                ),
                SizedBox(
                  width: 1.h,
                ),
                Text(
                  textButton,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
