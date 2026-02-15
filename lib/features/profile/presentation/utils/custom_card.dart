import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget child;
  const CustomCard({
    super.key,
    this.height,
    this.width = double.infinity,
    required this.child,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [Utils.cardShadow],
      ),
      child: widget.child,
    );
  }
}
