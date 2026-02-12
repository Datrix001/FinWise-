import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/styles/app_text_style.dart';
import 'package:finwise2/gen/assets.gen.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  final Widget? prefixIcon;
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPass = false,
    this.prefixIcon,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late ValueNotifier<bool> isObscure;

  @override
  void initState() {
    isObscure = ValueNotifier(widget.isPass ? true : false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isObscure,
      builder: (context, value, child) {
        return TextFormField(
          style: AppTextStyles.b1,
          controller: widget.controller,
          obscureText: value,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPass
                ? IconButton(
                    onPressed: () {
                      isObscure.value = !isObscure.value;
                    },
                    icon: value
                        ? Assets.png.view.image(width: 20.w)
                        : Assets.png.hide.image(width: 20.w),
                  )
                : null,
            hint: appTextB1(
              widget.hintText,
              color: AppColors.black.withAlpha(90),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black.withAlpha(70)),
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    isObscure.dispose();
    super.dispose();
  }
}
