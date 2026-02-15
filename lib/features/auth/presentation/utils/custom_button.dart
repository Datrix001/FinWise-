import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String? title;
  final bool isDiff;
  final Widget? widget;
  final bool fullWidth;
  const CustomButton({
    super.key,
    required this.onTap,
    this.title,
    this.isDiff = false,
    this.widget,
    required this.fullWidth,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: widget.fullWidth ? double.infinity : null,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: widget.isDiff
              ? Border.all(color: AppColors.black.withAlpha(90))
              : null,
          gradient: widget.isDiff
              ? null
              : LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [AppColors.primary, AppColors.secondary],
                ),
        ),
        child: Center(
          child: widget.isDiff
              ? widget.widget
              : appTextS3(widget.title!, color: AppColors.white),
        ),
      ),
    );
  }
}
