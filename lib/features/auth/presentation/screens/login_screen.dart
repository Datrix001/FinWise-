import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/features/auth/presentation/screens/signup_screen.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_button.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_form_field.dart';
import 'package:finwise2/gen/assets.gen.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 150.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 80.h,
                width: 80.w,
                padding: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topLeft,
                    end: AlignmentGeometry.bottomRight,
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Image.asset(
                  Assets.png.rupeeSymbol.path,
                  color: AppColors.white,
                ),
              ),
            ),
            20.verticalSpace,
            appTextH2("FinWise"),
            appTextS3(
              "Track and split expense",
              color: AppColors.black.withAlpha(90),
            ),
            40.verticalSpace,
            CustomFormField(
              hintText: "Email Address",
              controller: emailController,
              prefixIcon: Assets.png.mail.image(
                scale: 7,
                color: AppColors.black.withAlpha(90),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
              child: CustomFormField(
                hintText: "Password",
                controller: passwordController,
                prefixIcon: Assets.png.padlock.image(
                  scale: 7,
                  color: AppColors.black.withAlpha(90),
                ),
              ),
            ),
            CustomButton(onTap: () {}, title: "Log In"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: appTextB2(
                "Or Continue With",
                color: AppColors.black.withAlpha(70),
              ),
            ),
            CustomButton(
              onTap: () {},
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.svg.google, height: 20.h),
                  10.horizontalSpace,
                  appTextB1("Google", color: AppColors.black.withAlpha(90)),
                ],
              ),
              isDiff: true,
            ),
            10.verticalSpace,
            TextButton(
              onPressed: () => context.push(SignUpScreen.routeName),
              child: appTextB1(
                "Don't have an account? Sign up",
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
