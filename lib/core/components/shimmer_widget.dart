import 'package:flutter/material.dart';
import 'package:nixler_demo/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.light1,
      highlightColor: AppColors.brown,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: AppColors.brown,
        ),
      ),
    );
  }
}
