// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nixler_demo/core/components/shimmer_widget.dart';

import 'package:nixler_demo/core/extensions/size_extension.dart';
import 'package:nixler_demo/core/theme/app_colors.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';
import 'package:nixler_demo/gen/assets.gen.dart';

class EventCard extends StatefulWidget {
  final String? image;
  final String? title;
  final String? date;
  final String? locationAddress;
  const EventCard({
    Key? key,
    this.image,
    this.title,
    this.date,
    this.locationAddress,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: widget.image ??
                "https://images.pexels.com/photos/18487730/pexels-photo-18487730/free-photo-of-elderly-man-eating-breakfast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            fit: BoxFit.cover,
            height: 141.heightMultiplier,
            width: 107.widthMultiplier,
            progressIndicatorBuilder: (context, child, loadingProgress) {
              //if (loadingProgress == null) return child;
              return ShimmerWidget.rectangular(
                height: 141.heightMultiplier,
                width: 107.widthMultiplier,
              );
            },
            errorWidget: (context, error, stackTrace) {
              return Container(
                height: 141.heightMultiplier,
                width: 107.widthMultiplier,
                color: AppColors.lightBlack.withOpacity(0.2),
              );
            },
          ),
        ),
        SizedBox(
          width: 8.widthMultiplier,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title ?? "Tribute to A.R. Rahman by Fakhri",
                style: AppTextStyle.f14w500White,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.heightMultiplier,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.icons.calendarMonth),
                    SizedBox(
                      width: 8.widthMultiplier,
                    ),
                    Expanded(
                      child: Text(
                        widget.date ?? "24 May - 29 May",
                        style: AppTextStyle.f14w400White,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets.icons.locationOn),
                  SizedBox(
                    width: 8.widthMultiplier,
                  ),
                  Expanded(
                    child: Text(
                      widget.locationAddress ??
                          "Jaipur Club, Ring Road, Near highway",
                      style: AppTextStyle.f14w400White,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
