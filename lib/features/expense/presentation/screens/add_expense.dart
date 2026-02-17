import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/styles/app_text_style.dart';
import 'package:finwise2/core/utils/custom_appbar.dart';
import 'package:finwise2/core/utils/utils.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_button.dart';
import 'package:finwise2/features/auth/presentation/utils/custom_form_field.dart';
import 'package:finwise2/features/expense/presentation/utils/expense_utils.dart';
import 'package:finwise2/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});
  static const routeName = "/add-expense";

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  ValueNotifier<String?> selectedCategory = ValueNotifier(null);
  ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);
  ValueNotifier<String?> selectedPerson = ValueNotifier(null);
  ValueNotifier<Button2Clicked> selectedButton2 = ValueNotifier(
    Button2Clicked.equal,
  );
  ValueNotifier<ButtonClicked> selectedButton = ValueNotifier(
    ButtonClicked.firstButton,
  );
  ValueNotifier<String?> selectedGroup = ValueNotifier(null);

  List<DropdownMenuItem<String>> category = [
    DropdownMenuItem(value: "Food", child: appTextB1("Food")),
    DropdownMenuItem(value: "Travel", child: appTextB1("Travel")),
    DropdownMenuItem(value: "Grocery", child: appTextB1("Grocery")),
  ];

  List<DropdownMenuItem<String>> persons = [
    DropdownMenuItem(value: "You", child: appTextB1("You")),
    DropdownMenuItem(value: "Rajat", child: appTextB1("Rajat")),
    DropdownMenuItem(value: "Ayush", child: appTextB1("Ayush")),
  ];

  List<DropdownMenuItem<String>> groups = [
    DropdownMenuItem(value: "Flat Abhiyan", child: appTextB1("Flat Abhiyan")),
    DropdownMenuItem(value: "Road Trip", child: appTextB1("Road Trip")),
  ];

  late List<TextEditingController> splitControllers;
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    splitControllers = List.generate(
      persons.length,
      (_) => TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Add Expene"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [Utils.cardShadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appTextB1("AMOUNT", color: AppColors.black.withAlpha(120)),
                  TextFormField(
                    controller: amountController,
                    style: AppTextStyles.h1,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      hintText: "₹0.00",

                      hintStyle: AppTextStyles.h1.copyWith(
                        color: AppColors.black.withAlpha(70),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ExpenseUtils.expenseTitle("DESCRIPTION"),

            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.white,
                boxShadow: [Utils.cardShadow],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What is this for?",
                  hintStyle: AppTextStyles.b1.copyWith(
                    color: AppColors.black.withAlpha(70),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      ExpenseUtils.expenseTitle("CATEGORY"),

                      ExpenseUtils.dropDown(
                        items: category,
                        hint: "Select Category",
                        notifier: selectedCategory,
                      ),
                    ],
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpenseUtils.expenseTitle("DATE"),

                      ValueListenableBuilder<DateTime?>(
                        valueListenable: selectedDate,
                        builder: (context, date, _) {
                          return GestureDetector(
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: EdgeInsets.all(25.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: AppColors.white,
                                boxShadow: [Utils.cardShadow],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: appTextB1(
                                      date == null
                                          ? "Select Date"
                                          : "${date.day}/${date.month}/${date.year}",
                                      color: date == null
                                          ? AppColors.black.withAlpha(70)
                                          : AppColors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: AppColors.black.withAlpha(120),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ExpenseUtils.expenseTitle("PAID BY"),

            ExpenseUtils.dropDown(
              hint: "Select Person",
              items: persons,
              notifier: selectedPerson,
            ),

            ExpenseUtils.expenseTitle("EXPENSE TYPE"),

            ValueListenableBuilder(
              valueListenable: selectedButton,
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectedButton.value = ButtonClicked.firstButton;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color:
                                selectedButton.value ==
                                    ButtonClicked.firstButton
                                ? AppColors.primary.withOpacity(0.1)
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              color:
                                  selectedButton.value ==
                                      ButtonClicked.firstButton
                                  ? AppColors.primary
                                  : AppColors.white,
                            ),
                            boxShadow: [Utils.cardShadow],
                          ),
                          child: appTextS4("Personal"),
                        ),
                      ),
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectedButton.value = ButtonClicked.secondButton;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20.w),

                          decoration: BoxDecoration(
                            color:
                                selectedButton.value ==
                                    ButtonClicked.secondButton
                                ? AppColors.primary.withOpacity(0.1)
                                : AppColors.white,
                            border: Border.all(
                              color:
                                  selectedButton.value ==
                                      ButtonClicked.secondButton
                                  ? AppColors.primary
                                  : AppColors.white,
                            ),
                            borderRadius: BorderRadius.circular(15.r),

                            boxShadow: [Utils.cardShadow],
                          ),
                          child: appTextS4("Group"),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: selectedButton,
              builder: (context, value, child) {
                if (value != ButtonClicked.secondButton) {
                  return const SizedBox.shrink();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpenseUtils.expenseTitle("CHOOSE GROUP"),

                    ExpenseUtils.dropDown(
                      items: groups,
                      hint: "Select Group",
                      notifier: selectedGroup,
                    ),

                    ExpenseUtils.expenseTitle("SPLIT METHOD"),
                    ValueListenableBuilder(
                      valueListenable: selectedButton2,
                      builder: (context, value, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      selectedButton2.value =
                                          Button2Clicked.equal;
                                    },
                                    child: ExpenseUtils.splitTile(
                                      title: "Equal",
                                      isSelected: value == Button2Clicked.equal,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      selectedButton2.value =
                                          Button2Clicked.unEqual;
                                    },
                                    child: ExpenseUtils.splitTile(
                                      title: "Unequal",
                                      isSelected:
                                          value == Button2Clicked.unEqual,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      selectedButton2.value =
                                          Button2Clicked.percent;
                                    },
                                    child: ExpenseUtils.splitTile(
                                      title: "Percent",
                                      isSelected:
                                          value == Button2Clicked.percent,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ExpenseUtils.expenseTitle(
                              value == Button2Clicked.equal
                                  ? "SPLIT DETAILS (AUTO CALCULATED)"
                                  : "SPLIT DETAILS",
                            ),
                          ],
                        );
                      },
                    ),

                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [Utils.cardShadow],
                      ),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: persons.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Row(
                                  children: [
                                    appTextB1(persons[index].value!),
                                    Spacer(),

                                    Expanded(
                                      child:
                                          ValueListenableBuilder<
                                            Button2Clicked
                                          >(
                                            valueListenable: selectedButton2,
                                            builder: (context, splitValue, _) {
                                              return ValueListenableBuilder<
                                                TextEditingValue
                                              >(
                                                valueListenable:
                                                    amountController,
                                                builder: (context, value, _) {
                                                  final amount =
                                                      double.tryParse(
                                                        value.text.trim(),
                                                      ) ??
                                                      0.0;
                                                  return CustomFormField(
                                                    hintText:
                                                        selectedButton2.value ==
                                                            Button2Clicked.equal
                                                        ? (amount /
                                                                  persons
                                                                      .length)
                                                              .roundToDouble()
                                                              .toString()
                                                        : "0.0",
                                                    controller:
                                                        splitControllers[index],
                                                    isEnabled:
                                                        selectedButton2.value !=
                                                        Button2Clicked.equal,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Divider(color: AppColors.black.withAlpha(70)),
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Row(
                              children: [
                                appTextB1("Total"),
                                Spacer(),
                                appTextS3("₹100"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            20.verticalSpace,
            CustomButton(
              onTap: () => context.pop(),
              fullWidth: true,
              title: "Save Expense",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  @override
  void dispose() {
    for (final c in splitControllers) {
      c.dispose();
    }
    selectedButton.dispose();
    selectedButton2.dispose();
    selectedCategory.dispose();
    selectedDate.dispose();
    selectedPerson.dispose();
    selectedGroup.dispose();
    amountController.dispose();
    super.dispose();
  }
}

enum ButtonClicked { firstButton, secondButton }

enum Button2Clicked { equal, unEqual, percent }
