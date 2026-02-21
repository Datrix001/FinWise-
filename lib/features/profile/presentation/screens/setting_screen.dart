import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_button.dart';
import 'package:finwise2/features/friend/presentation/screens/friend_screen.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_state.dart';
import 'package:finwise2/features/profile/presentation/utils/custom_card.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const routeName = "/settings-screen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              current is AuthFailureState && previous is! AuthFailureState,
          listener: (context, state) {
            if (state is AuthFailureState) {
              Utils.showError(context, state.errorMessage);
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              current is ProfileFailureState &&
              previous is! ProfileFailureState,
          listener: (context, state) {
            if (state is ProfileFailureState) {
              Utils.showError(context, state.errorMessage);
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) => current is ProfileLoadedState,
              builder: (context, state) {
                if (state is ProfileLoadedState) {
                  final user = state.model;
                  print(user.name);
                  return CustomCard(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 80.h,
                          width: 80.w,
                          decoration: Utils.logoBoxDecoration(),
                          child: appTextH2(
                            user.name[0],
                            color: AppColors.white,
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: appTextS2(
                            user.name,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Expanded(
                          child: CustomButton(
                            fullWidth: false,
                            onTap: () {},
                            isDiff: true,
                            widget: appTextB1("Edit"),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox.shrink();
              },
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
                    onTap: () => context.push(FriendScreen.routeName),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.black.withAlpha(26),
                          ),
                          child: Icon(
                            Icons.person_add,
                            color: AppColors.black.withAlpha(128),
                          ),
                        ),
                        20.horizontalSpace,
                        appTextS3("Add Friends"),
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
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) =>
                  current is AuthInitialState || current is AuthLoadingState,
              builder: (context, state) {
                return CustomButton(
                  onTap: () => context.read<AuthCubit>().signOut(),
                  fullWidth: true,
                  title: state is AuthLoadingState
                      ? "Logging out..."
                      : "Logout",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
