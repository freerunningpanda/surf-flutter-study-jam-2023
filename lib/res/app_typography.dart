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
}