import 'package:finwise2/core/styles/app_text.dart';
import 'package:finwise2/core/utils/custom_appbar.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});
  static const routeName = "/friend-screen";

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "Friends"));
  }
}
