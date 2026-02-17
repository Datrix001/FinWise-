import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/custom_appbar.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/features/expense/presentation/screens/add_expense.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});
  static const routeName = "/expense-screen";

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: "Expenses",
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => context.push(AddExpense.routeName),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.white),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [Utils.cardShadow],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [Utils.cardShadow],
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final isIncome = index.isEven;

              return Column(
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
                                color: AppColors.black.withAlpha(153), // 0.6
                              ),
                            ],
                          ),
                        ),

                        appTextS2(
                          isIncome ? "+₹100" : "-₹10",
                          color: isIncome ? AppColors.secondary : AppColors.red,
                        ),
                        PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 18,
                            color: AppColors.black.withAlpha(100),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          color: AppColors.white,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'Edit',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: AppColors.black.withAlpha(180),
                                  ),

                                  5.horizontalSpace,
                                  appTextB1(
                                    "Edit",
                                    color: AppColors.black.withAlpha(180),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'Delete',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 15,
                                    color: AppColors.red,
                                  ),
                                  5.horizontalSpace,
                                  appTextB1("Delete", color: AppColors.red),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 'Edit':
                                context.push(AddExpense.routeName);
                              case 'Delete':
                                context.push(AddExpense.routeName);
                            }
                          },
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
              );
            },
          ),
        ),
      ),
    );
  }
}
