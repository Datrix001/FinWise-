import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/styles/app_text_style.dart';
import 'package:finwise2/features/expense/presentation/screens/add_expense.dart';
import 'package:finwise2/features/expense/presentation/screens/expense_analyse_screen.dart';
import 'package:finwise2/features/group/presentation/screens/add_group.dart';
import 'package:finwise2/features/group/presentation/screens/group_screen.dart';
import 'package:finwise2/features/home/presentation/screens/home_screen.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_state.dart';
import 'package:finwise2/features/profile/presentation/screens/setting_screen.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  final List<Widget> screens = [
    HomeScreen(),
    ExpenseAnalyseScreen(),
    GroupScreen(),
    SettingScreen(),
  ];

  final List<String> screensTitle = ["Welcome", "Analyse", "Groups", "Setting"];

  @override
  void initState() {
    context.read<ProfileCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndex,
      builder: (context, index, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) =>
                  current is ProfileLoadedState ||
                  current is ProfileInitialState,
              builder: (context, state) {
                if (state is ProfileLoadedState) {
                  final data = state.model;
                  return AppBar(
                    toolbarHeight: 60,
                    backgroundColor: AppColors.transparent,
                    elevation: 0,
                    title: index == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appTextB2(
                                "${screensTitle[index]},",
                                color: AppColors.white,
                              ),
                              appTextS2(
                                data.name,
                                color: AppColors.white.withOpacity(0.9),
                              ),
                            ],
                          )
                        : appTextS2(
                            screensTitle[index],
                            color: AppColors.white,
                          ),
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.secondary, AppColors.primary],
                        ),
                      ),
                    ),
                  );
                }
                return AppBar(
                  toolbarHeight: 60,
                  backgroundColor: AppColors.transparent,
                  elevation: 0,
                  title: index == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appTextB2(
                              "${screensTitle[index]},",
                              color: AppColors.white,
                            ),
                            appTextS2(
                              "",
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ],
                        )
                      : appTextS2(screensTitle[index], color: AppColors.white),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.secondary, AppColors.primary],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 25.h,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: AppColors.secondary.withOpacity(0.7),
            selectedLabelStyle: AppTextStyles.b1,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: index,
            onTap: (value) {
              currentIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: _gradientIcon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                activeIcon: _gradientIcon(Icons.analytics),
                label: "Analyse",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_outlined),
                activeIcon: _gradientIcon(Icons.group),
                label: "Group",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: _gradientIcon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
          floatingActionButton: index == 0 || index == 2
              ? FloatingActionButton(
                  onPressed: () => index == 0
                      ? context.push(AddExpense.routeName)
                      : context.push(AddGroup.routeName),
                  backgroundColor: AppColors.transparent,
                  child: Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      gradient: LinearGradient(
                        begin: AlignmentGeometry.topLeft,
                        end: AlignmentGeometry.bottomCenter,
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                    ),
                    child: Icon(Icons.add, color: AppColors.white),
                  ),
                )
              : null,
          body: screens[index],
        );
      },
    );
  }

  Widget _gradientIcon(IconData icon) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [AppColors.secondary, AppColors.primary],
        ).createShader(bounds);
      },
      child: Icon(icon, color: Colors.white),
    );
  }

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }
}
