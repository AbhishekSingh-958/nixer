import 'package:flutter/material.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';

class ChatMainScreen extends StatelessWidget {
  const ChatMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chat Screen',
        style: AppTextStyle.f20w500White,
      ),
    );
  }
}
