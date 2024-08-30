import 'package:flutter/material.dart';
import 'package:nixler_demo/core/extensions/size_extension.dart';

import 'app_colors.dart';

abstract class AppTextStyle { 
    static final f20w500White = TextStyle(
    fontSize: 20.heightMultiplier,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final f16w600White = TextStyle(
    fontSize: 16.heightMultiplier,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final f16w500White = TextStyle(
    fontSize: 16.heightMultiplier,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final f14w500White = TextStyle(
    fontSize: 14.heightMultiplier,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final f14w400White = TextStyle(
    fontSize: 14.heightMultiplier,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static final f12W400White = TextStyle(
    fontSize: 12.heightMultiplier,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
    static final f12W500White = TextStyle(
    fontSize: 12.heightMultiplier,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final f14W400Brown = TextStyle(
    fontSize: 14.heightMultiplier,
    fontWeight: FontWeight.w400,
    color: AppColors.brown,
  );

  static final f12W500Pink = TextStyle(
    fontSize: 12.heightMultiplier,
    fontWeight: FontWeight.w500,
    color: AppColors.pink,
  );

}
