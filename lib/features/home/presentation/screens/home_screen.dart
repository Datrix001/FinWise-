import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/features/expense/data/models/expense_details_model.dart';
import 'package:finwise2/features/expense/presentation/screens/expense_detail_screen.dart';
import 'package:finwise2/features/expense/presentation/screens/expenses_screen.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [Utils.cardShadow],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTextB1("Net Balance", color: AppColors.black.withAlpha(153)),
                _gradientText("+₹10,000", false),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      height: 80.h,
                      width: 140.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withAlpha(26),
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: AppColors.primary.withAlpha(51),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          appTextB2("OWED TO YOU", color: AppColors.secondary),
                          _gradientText("+₹100", true),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 80.h,
                      width: 140.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: AppColors.red.withAlpha(26),
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: AppColors.red.withAlpha(51)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          appTextB2("YOU OWE", color: AppColors.red),
                          appTextS1("-₹10", color: AppColors.red),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          20.verticalSpace,

          Row(
            children: [
              appTextS3("Recent Activity"),
              const Spacer(),
              TextButton(
                onPressed: () => context.push(ExpensesScreen.routeName),
                child: appTextB1(
                  "View All →",
                  color: AppColors.primary.withBlue(10),
                ),
              ),
            ],
          ),

          10.verticalSpace,

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [Utils.cardShadow],
              ),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final isIncome = index.isEven;

                  return GestureDetector(
                    onTap: () => context.push(
                      ExpenseDetailScreen.routeName,
                      extra: ExpenseDetailsModel(
                        description: "Grocery Shopping",
                        category: "Food Dining",
                        type: "Personal",
                        amount: "₹1000",
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                          child: Row(
                            children: [
                              Container(
                                width: 4.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: isIncome
                                      ? AppColors.secondary
                                      : AppColors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              10.horizontalSpace,

                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isIncome
                                      ? AppColors.secondary.withAlpha(38)
                                      : AppColors.red.withAlpha(38),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: appTextB2(
                                  isIncome ? "INC" : "EXP",
                                  color: isIncome
                                      ? AppColors.secondary
                                      : AppColors.red,
                                ),
                              ),
                              10.horizontalSpace,

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appTextB1(
                                      "Grocery Shopping",
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    4.verticalSpace,
                                    appTextB2(
                                      "Personal • Feb 3",
                                      color: AppColors.black.withAlpha(
                                        153,
                                      ), // 0.6
                                    ),
                                  ],
                                ),
                              ),

                              appTextS2(
                                isIncome ? "+₹100" : "-₹10",
                                color: isIncome
                                    ? AppColors.secondary
                                    : AppColors.red,
                              ),
                            ],
                          ),
                        ),
                        12.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Divider(
                            thickness: 1,
                            color: AppColors.black.withAlpha(26),
                          ),
                        ),
                      ],
                    ),
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
}
