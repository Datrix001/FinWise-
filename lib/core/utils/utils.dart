import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static final cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 16,
    offset: const Offset(0, 8),
  );

  static BoxDecoration logoBoxDecoration({
    double borderRadius = 25,
    bool isDiff = false,
  }) {
    return BoxDecoration(
      color: isDiff ? AppColors.black.withAlpha(20) : null,
      gradient: isDiff
          ? null
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
            ),
      borderRadius: BorderRadius.circular(borderRadius.r),
    );
  }

  static final customBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15.r),
    color: AppColors.white,
    boxShadow: [Utils.cardShadow],
  );

  static Widget customAppBarActionItem(VoidCallback onTap, Widget icon) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.white),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [Utils.cardShadow],
          ),
          child: Padding(padding: EdgeInsets.all(4.0.w), child: icon),
        ),
      ),
    );
  }

  static Widget customTitle(String title) {
    return appTextB1(
      title.toUpperCase(),
      color: AppColors.black.withAlpha(100),
    );
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: appTextB1(message)));
  }
}
