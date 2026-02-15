import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  Widget _gradientText(String text, bool isSmall) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [AppColors.secondary, AppColors.primary],
        ).createShader(bounds);
      },
      child: isSmall
          ? appTextS1(text)
          : appTextH1(text, color: AppColors.white),
    );
  }

  static final cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  static final logoBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: AlignmentGeometry.topLeft,
      end: AlignmentGeometry.bottomRight,
      colors: [AppColors.primary, AppColors.secondary],
    ),
    borderRadius: BorderRadius.circular(25.r),
  );
}
