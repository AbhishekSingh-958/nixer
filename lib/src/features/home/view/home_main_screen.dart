import 'package:flutter/material.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: AppTextStyle.f20w500White,
      ),
    );
  }
}
