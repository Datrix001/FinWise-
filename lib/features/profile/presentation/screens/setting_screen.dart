import 'package:finwise2/core/styles/app_text.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const routeName = "/settings-screen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Center(child: appTextH1("Settings Page"))]);
  }
}
