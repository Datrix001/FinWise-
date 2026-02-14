import 'package:finwise2/core/styles/app_text.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});
  static const routeName = "/group-screen";

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Center(child: appTextH1("Group Page"))]);
  }
}
