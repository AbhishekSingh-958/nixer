import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nixler_demo/core/config/size_config.dart';
import 'package:nixler_demo/core/extensions/size_extension.dart';
import 'package:nixler_demo/core/theme/app_colors.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';
import 'package:nixler_demo/core/utils/common_functions.dart';
import 'package:nixler_demo/gen/assets.gen.dart';
import 'package:nixler_demo/src/features/events/model/live_music.dart';

class EventDetailScreen extends StatefulWidget {
  final LiveMusicData liveMusicData;
  const EventDetailScreen({required this.liveMusicData, super.key});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final gender = ["Male", "Female", "Everyone"];
  String? selectedGender;
  DateTime? selectedDate;
  String? startDate;
  String? endDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
          20.widthMultiplier,
          50.heightMultiplier,
          20.widthMultiplier,
          20.heightMultiplier,
        ),
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightBlack,
              AppColors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.liveMusicData.title ??
                          "Tribute to A.R. Rahman by Fakhri",
                      style: AppTextStyle.f20w500White,
                    ),
                    const SizedBox(height: 16),
                    _buildImage(),
                    const SizedBox(height: 16),
                    _buildEventDetails(),
                    const SizedBox(height: 16),
                    _buildLocation(),
                    const SizedBox(height: 16),
                    _buildGenderSelection(),
                    const SizedBox(height: 24),
                    _buildDateSelection(),
                    const SizedBox(height: 24),
                    _buildPublishButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(Assets.icons.backButton),
        ),
        const SizedBox(width: 8),
        Text(
          "Live music",
          style: AppTextStyle.f20w500White,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 301.heightMultiplier,
        child: Image.network(
          widget.liveMusicData.coverImageUrl ??
              "https://images.pexels.com/photos/17426411/pexels-photo-17426411/free-photo-of-man-sitting-with-surfboard-in-van.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildEventDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildEventDetail(
          icon: Assets.icons.calendarMonth,
          text: getFormattedDate(widget.liveMusicData.eventVisibilityStartDate,
              widget.liveMusicData.eventVisibilityEndDate!),
        ),
        _buildEventDetail(
          icon: Assets.icons.person,
          text: "32 interests",
        ),
      ],
    );
  }

  Widget _buildEventDetail({required String icon, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyle.f14w400White,
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.locationOn),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            widget.liveMusicData.address ??
                "Jaipur club, ring road, near highway",
            style: AppTextStyle.f14w400White,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select your gender preference",
          style: AppTextStyle.f16w500White,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 25.heightMultiplier,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _buildGenderOption(index),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: gender.length,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderOption(int index) {
    final isSelected = selectedGender == gender[index];
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender[index];
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.widthMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? AppColors.white
              : AppColors.lightOlive.withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            gender[index],
            style: AppTextStyle.f12W400White.copyWith(
              color: isSelected ? AppColors.lightOlive : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select your Preferred date",
          style: AppTextStyle.f16w500White,
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
            );
            if (date != null) {
              setState(() {
                selectedDate = date;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.heightMultiplier,
              horizontal: 16.widthMultiplier,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.lightOlive.withOpacity(0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? DateFormat("MM-dd-yyyy").format(selectedDate!)
                      : "Select date",
                  style: selectedDate != null
                      ? AppTextStyle.f14w500White
                      : AppTextStyle.f14W400Brown,
                ),
                SvgPicture.asset(Assets.icons.calendarMonth),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPublishButton() {
    return SizedBox(
      width: double.infinity,
      height: 48.heightMultiplier,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Publish your interest",
          style: AppTextStyle.f14w500White,
        ),
      ),
    );
  }
}
