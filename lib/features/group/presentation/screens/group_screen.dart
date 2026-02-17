import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});
  static const routeName = "/group-screen";

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: Utils.customBoxDecoration,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appTextB1("Weekend Trip"),
                        appTextB1(
                          "3 members",
                          color: AppColors.black.withAlpha(70),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        appTextS2(
                          "+₹100",
                          color: AppColors.primary.withBlue(50),
                        ),
                        appTextB1("Owed", color: AppColors.black.withAlpha(70)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Divider(
                    thickness: 1,
                    color: AppColors.black.withAlpha(20),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appTextB1("Apartment"),
                        appTextB1(
                          "2 members",
                          color: AppColors.black.withAlpha(70),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        appTextS2("-₹100", color: AppColors.red.withBlue(50)),
                        appTextB1(
                          "You owe",
                          color: AppColors.black.withAlpha(70),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Divider(
                    thickness: 1,
                    color: AppColors.black.withAlpha(20),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appTextB1("Flat Abhiyan"),
                        appTextB1(
                          "8 members",
                          color: AppColors.black.withAlpha(70),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        appTextS2(
                          "+₹1000",
                          color: AppColors.primary.withBlue(50),
                        ),
                        appTextB1("Owed", color: AppColors.black.withAlpha(70)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
