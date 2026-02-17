import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_button.dart';
import 'package:finwise2/features/profile/presentation/utils/custom_card.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const routeName = "/settings-screen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          current is AuthLoadingState || previous is AuthLoadingState,
      listenWhen: (previous, current) =>
          current is AuthFailureState && previous is! AuthFailureState,
      listener: (context, state) {
        if (state is AuthFailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: appTextB1(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 80.h,
                      width: 80.w,
                      decoration: Utils.logoBoxDecoration(),
                      child: appTextH2("M", color: AppColors.white),
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: appTextS2(
                        "Mayank Moulli Singh",
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      fullWidth: false,
                      onTap: () {},
                      isDiff: true,
                      widget: appTextB1("Edit"),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                child: appTextB1(
                  "PREFERENCES",
                  color: AppColors.black.withAlpha(179),
                ),
              ),

              CustomCard(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.black.withAlpha(26),
                            ),
                            child: Icon(
                              Icons.language,
                              color: AppColors.black.withAlpha(128),
                            ),
                          ),
                          20.horizontalSpace,
                          appTextS3("Currency"),
                          Spacer(),
                          appTextB1(
                            "INR(₹)",
                            color: AppColors.black.withAlpha(128),
                          ),
                          10.horizontalSpace,
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.black.withAlpha(128),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Divider(
                        thickness: 1,
                        color: AppColors.black.withAlpha(26),
                      ),
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.black.withAlpha(26),
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: AppColors.black.withAlpha(128),
                            ),
                          ),
                          20.horizontalSpace,
                          appTextS3("Notifications"),
                          Spacer(),
                          appTextB1(
                            "Enabled",
                            color: AppColors.black.withAlpha(128),
                          ),
                          10.horizontalSpace,
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.black.withAlpha(128),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                child: appTextB1(
                  "ACCOUNT",
                  color: AppColors.black.withAlpha(179),
                ),
              ),

              CustomCard(
                child: Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.black.withAlpha(26),
                            ),
                            child: Icon(
                              Icons.lock,
                              color: AppColors.black.withAlpha(128),
                            ),
                          ),
                          20.horizontalSpace,
                          appTextS3("Privacy & Security"),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.black.withAlpha(128),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Divider(
                        thickness: 1,
                        color: AppColors.black.withAlpha(26),
                      ),
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.black.withAlpha(26),
                            ),
                            child: Icon(
                              Icons.question_answer_outlined,
                              color: AppColors.black.withAlpha(128),
                            ),
                          ),
                          20.horizontalSpace,
                          appTextS3("Help & Support"),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.black.withAlpha(128),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              20.verticalSpace,
              CustomButton(
                onTap: () => context.read<AuthCubit>().signOut(),
                fullWidth: true,
                title: state is AuthLoadingState ? "Logging out..." : "Logout",
              ),
            ],
          ),
        );
      },
    );
  }
}
