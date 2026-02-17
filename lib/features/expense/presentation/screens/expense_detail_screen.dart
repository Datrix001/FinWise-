import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/custom_appbar.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_button.dart';
import 'package:finwise2/features/expense/data/models/expense_details_model.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpenseDetailScreen extends StatefulWidget {
  final ExpenseDetailsModel model;
  const ExpenseDetailScreen({super.key, required this.model});
  static const routeName = "/expense-details";

  @override
  State<ExpenseDetailScreen> createState() => _ExpenseDetailScreenState();
}

class _ExpenseDetailScreenState extends State<ExpenseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Expense Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: Utils.customBoxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  appTextB1(
                    "Total Amount",
                    color: AppColors.black.withAlpha(120),
                  ),
                  appTextH1(model.amount),
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: Utils.customBoxDecoration,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            children: [
                              appTextB2(
                                "Description",
                                color: AppColors.black.withAlpha(100),
                              ),
                              Spacer(),
                              appTextB1(
                                model.description,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withAlpha(20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            children: [
                              appTextB2(
                                "Category",
                                color: AppColors.black.withAlpha(100),
                              ),
                              Spacer(),
                              appTextB1(model.category),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withAlpha(20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            children: [
                              appTextB2(
                                "Date",
                                color: AppColors.black.withAlpha(100),
                              ),
                              Spacer(),
                              appTextB1("9th January"),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withAlpha(20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            children: [
                              appTextB2(
                                "Type",
                                color: AppColors.black.withAlpha(100),
                              ),
                              Spacer(),
                              appTextB1(model.type),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.black.withAlpha(20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: Utils.customTitle("paid by"),
            ),
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: Utils.customBoxDecoration,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: Utils.logoBoxDecoration(borderRadius: 10.r),
                    child: Icon(Icons.person, color: AppColors.white),
                  ),
                  20.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appTextS3("You"),
                      appTextB1(
                        "\$85.00",
                        color: AppColors.black.withAlpha(120),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: Utils.customTitle("split breakdown"),
            ),
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: Utils.customBoxDecoration,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: Utils.logoBoxDecoration(
                            borderRadius: 10.r,
                            isDiff: true,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 15,
                            color: AppColors.black.withAlpha(70),
                          ),
                        ),
                        20.horizontalSpace,
                        appTextS3("You"),
                        Spacer(),
                        appTextB1("\$85.00", color: AppColors.black),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: AppColors.black.withAlpha(20)),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: Utils.logoBoxDecoration(
                            borderRadius: 10.r,
                            isDiff: true,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 15,
                            color: AppColors.black.withAlpha(70),
                          ),
                        ),
                        20.horizontalSpace,
                        appTextS3("Rajat"),
                        Spacer(),
                        appTextB1("\$85.00", color: AppColors.black),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: AppColors.black.withAlpha(20)),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: Utils.logoBoxDecoration(
                            borderRadius: 10.r,
                            isDiff: true,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 15,
                            color: AppColors.black.withAlpha(70),
                          ),
                        ),
                        20.horizontalSpace,
                        appTextS3("Ayush"),
                        Spacer(),
                        appTextB1("\$85.00", color: AppColors.black),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: AppColors.black.withAlpha(20)),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        appTextS3("Total"),
                        Spacer(),
                        appTextS3(model.amount, color: AppColors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            CustomButton(
              onTap: () => context.pop(context),
              fullWidth: true,
              title: "Edit Expense",
            ),
          ],
        ),
      ),
    );
  }
}
