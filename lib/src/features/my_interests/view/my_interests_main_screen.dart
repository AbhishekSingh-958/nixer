import 'package:flutter/material.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';

class MyInterestMainScreen extends StatelessWidget {
  const MyInterestMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Interests',
        style: AppTextStyle.f20w500White,
      ),
    );
  }
}
