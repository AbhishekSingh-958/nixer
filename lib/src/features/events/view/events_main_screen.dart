import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nixler_demo/core/components/search_field.dart';
import 'package:nixler_demo/core/extensions/size_extension.dart';
import 'package:nixler_demo/core/theme/app_colors.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';
import 'package:nixler_demo/gen/assets.gen.dart';
import 'package:nixler_demo/src/features/events/view/live_music_screen.dart';
import 'package:nixler_demo/src/features/events/widgets/event_card.dart';

class EventsMainScreen extends StatefulWidget {
  const EventsMainScreen({super.key});

  @override
  State<EventsMainScreen> createState() => _EventsMainScreenState();
}

class _EventsMainScreenState extends State<EventsMainScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<List<String>> _entertainmentList = [
    [Assets.icons.brunchDining, 'Resturants'],
    [Assets.icons.nightlife, 'Clubs'],
    [Assets.icons.musicNote, 'Live Music'],
    [Assets.icons.sportsBasketball, 'Sports'],
    [Assets.icons.localCafe, 'Cafe'],
    [Assets.icons.comedyMask, 'Comedy'],
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0.heightMultiplier,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.indiaGate),
                        8.horizontalSpace,
                        Text('Delhi NCR', style: AppTextStyle.f16w600White),
                        10.horizontalSpace,
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(Assets.images.personProfile.path),
                  ],
                ),
              ),
              8.verticalSpace,
              SearchField(
                onCutTap: () {},
                controller: _searchController,
              ),
              24.verticalSpace,
              Text(
                'What are you looking for',
                style: AppTextStyle.f16w600White,
              ),
              24.verticalSpace,
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _entertainmentList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () {
                        _navigationHandle(index);
                      },
                      child: _serviceCatagoryWidget(
                        icon: _entertainmentList[index][0],
                        title: _entertainmentList[index][1],
                      ),
                    )),
              ),
              24.verticalSpace,
              Text('Featured', style: AppTextStyle.f16w600White),
              24.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.olive.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  const EventCard(),
                  16.verticalSpace,
                  const EventCard(),
                  16.verticalSpace,
                  const EventCard(),
                ]),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _navigationHandle(int index){
      switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LiveMusicScreen()));
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      default:
        break;
    }
  }

  Widget _serviceCatagoryWidget({
    required String title,
    required String icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.olive.withOpacity(0.2)),
        width: 107.widthMultiplier,
        height: 95.heightMultiplier,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
              ),
              8.verticalSpace,
              Text(
                title,
                style: AppTextStyle.f14w500White,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
