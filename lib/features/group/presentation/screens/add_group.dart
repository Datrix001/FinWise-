import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({super.key});
  static const routeName = "/add-group";

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        toolbarHeight: 60,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: appTextS2("Add Group", color: AppColors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.secondary, AppColors.primary],
            ),
          ),
        ),
      ),
    );
  }
}
