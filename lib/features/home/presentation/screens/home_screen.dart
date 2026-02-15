import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            height: 220.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [cardShadow],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTextB1(
                  "Net Balance",
                  color: AppColors.black.withOpacity(0.6),
                ),
                _gradientText("+₹10,000", false),
                Spacer(),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      height: 80.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.15),
                            offset: Offset(0, 6),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          appTextB2("OWED TO YOU", color: AppColors.secondary),
                          _gradientText("+₹10,000", true),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      height: 80.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: AppColors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: AppColors.red.withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.red.withOpacity(0.15),
                            offset: Offset(0, 8),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          appTextB2("YOU OWE", color: AppColors.red),
                          appTextS1("-₹10,000", color: AppColors.red),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
            child: Row(
              children: [
                appTextS3("Recent Activity"),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: appTextB1("View All ->", color: AppColors.secondary),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.white,
                boxShadow: [cardShadow],
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, ixdex) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.w,
                          right: 30.w,
                          top: 20.h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appTextB1("Grocery Shopping"),
                                  4.verticalSpace,
                                  appTextB2(
                                    "Personal • Feb 3",
                                    color: AppColors.black.withOpacity(0.6),
                                  ),
                                ],
                              ),
                            ),
                            appTextS2("₹10"),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Divider(
                          thickness: 1,
                          color: AppColors.black.withOpacity(0.15),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  final cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 16,
    offset: Offset(0, 8),
  );
}
