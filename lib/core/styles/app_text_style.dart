import 'package:finwise2/core/styles/text_size.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:finwise2/gen/fonts.gen.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppTextStyles {
  AppTextStyles._();

  static TextStyle get h1 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size40.sp,
    color: AppColors.black,
  );

  static TextStyle get h2 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size32.sp,
    color: AppColors.black,
  );

  static TextStyle get h3 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size20.sp,
    color: AppColors.black,
  );

  static TextStyle get s1 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get s2 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get s3 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get s4 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get b1 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get b2 => TextStyle(
    fontFamily: FontFamily.sourceCodePro,
    fontSize: AppFontSize.size12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
}
