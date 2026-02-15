import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/features/auth/data/model/user_model.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:finwise2/features/auth/presentation/screens/login_screen.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_button.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_form_field.dart';
import 'package:finwise2/gen/assets.gen.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = "/signUp-screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            current is AuthInitialState || current is AuthLoadingState,
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
          final isLoading = state is AuthLoadingState;

          return SingleChildScrollView(
            padding: EdgeInsets.only(left: 42.w, right: 42.w, top: 100.h),
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
                Padding(
                  padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                  child: CustomFormField(
                    hintText: "Full Name",
                    controller: fullNameController,
                    prefixIcon: Assets.png.user.image(
                      scale: 7,
                      color: AppColors.black.withAlpha(90),
                    ),
                  ),
                ),

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
                    isPass: true,
                    controller: passwordController,
                    prefixIcon: Assets.png.padlock.image(
                      scale: 7,
                      color: AppColors.black.withAlpha(90),
                    ),
                  ),
                ),
                CustomButton(
                  fullWidth: true,
                  onTap: isLoading
                      ? null
                      : () => onTap(
                          passwordController.text,
                          emailController.text,
                          fullNameController.text,
                        ),
                  title: isLoading ? "Creating Account...." : "Sign Up",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: appTextB2(
                    "Or Continue With",
                    color: AppColors.black.withAlpha(70),
                  ),
                ),
                CustomButton(
                  fullWidth: true,

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
                  onPressed: () => context.push(LoginScreen.routeName),
                  child: appTextB1(
                    "Have an account? Sign In",
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onTap(String password, String email, String fullName) {
    final UserModel model = UserModel(
      email: email,
      password: password,
      fullName: fullName,
    );

    if (!email.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: appTextB1("Enter a valid email")));
      return;
    }

    if (email.isEmpty || password.isEmpty || fullName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: appTextB1("Please all the form fields")),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: appTextB1("Password must be greater than 6 characters"),
        ),
      );
      return;
    }

    context.read<AuthCubit>().signUpWithEmailAndPassword(model);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }
}
