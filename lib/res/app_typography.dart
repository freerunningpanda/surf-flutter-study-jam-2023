import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Файл шрифтов.
abstract class AppTypography {
  static const text22Regular = TextStyle(
    fontSize: 22,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static const text16Regular = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const text16RegularBtn = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonTextColor,
  );

  static const text16RegularDescription = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
    color: AppColors.appDarkGrey,
  );

  static const text16RegularBtnWhite = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor,
  );

  static const text14RegularTitle = TextStyle(
    fontSize: 14,
    height: 1.25,
    fontWeight: FontWeight.w600,
    color: AppColors.ticketTitleColor,
  );

  static const text14Light = TextStyle(
    fontSize: 14,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.appGrey,
  );

  static const text12Light = TextStyle(
    fontSize: 14,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.appGrey,
  );
}
