import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/styles/app_text_style.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseUtils {
  static Widget splitTile({required String title, required bool isSelected}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withOpacity(0.1)
            : AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.white,
        ),
        boxShadow: [Utils.cardShadow],
      ),
      child: appTextS4(title),
    );
  }

  static Widget dropDown({
    required List<DropdownMenuItem<String>> items,
    required ValueNotifier<dynamic> notifier,
    required String hint,
  }) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.white,
            boxShadow: [Utils.cardShadow],
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: AppColors.white,
            style: AppTextStyles.b1,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            isExpanded: true,
            hint: appTextB1(
              hint,
              color: AppColors.black.withAlpha(70),
              textOverflow: TextOverflow.ellipsis,
            ),
            initialValue: value,
            items: items,

            onChanged: (newValue) {
              notifier.value = newValue!;
            },
          ),
        );
      },
    );
  }

  static Widget expenseTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: Utils.customTitle(title),
    );
  }
}
