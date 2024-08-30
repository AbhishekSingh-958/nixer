import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nixler_demo/constants/string_constants.dart';
import 'package:nixler_demo/core/config/size_config.dart';
import 'package:nixler_demo/core/extensions/size_extension.dart';
import 'package:nixler_demo/core/theme/app_colors.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';
import 'package:nixler_demo/gen/assets.gen.dart';
import 'package:nixler_demo/src/features/chats/view/chat_main_screen.dart';
import 'package:nixler_demo/src/features/dashboard/provider/dashboard_provider.dart';
import 'package:nixler_demo/src/features/events/view/events_main_screen.dart';
import 'package:nixler_demo/src/features/home/view/home_main_screen.dart';
import 'package:nixler_demo/src/features/my_interests/view/my_interests_main_screen.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late DashBoardProvider dashBoardProvider;
  @override
  void initState() {
    super.initState();
    dashBoardProvider = Provider.of(context, listen: false);
  }

  final List<Widget> _dashboardTabs = <Widget>[
    const HomeMainScreen(),
    const EventsMainScreen(),
    const ChatMainScreen(),
    const MyInterestMainScreen(),
  ];

  void _onItemTapped(int index) {
    dashBoardProvider.selectCategoryByIndex(index);
  }

  final List<BottomNavItemData> bottomIcons = [
    BottomNavItemData(
      activeIcon: Assets.icons.home,
      inActiveIcon: Assets.icons.home,
      label: DashboardConstants.home,
    ),
    BottomNavItemData(
      activeIcon: Assets.icons.eventDashboard,
      inActiveIcon: Assets.icons.eventDashboard,
      label: DashboardConstants.events,
    ),
    BottomNavItemData(
      activeIcon: Assets.icons.chatBubble,
      inActiveIcon: Assets.icons.chatBubble,
      label: DashboardConstants.chat,
    ),
    BottomNavItemData(
      activeIcon: Assets.icons.interests,
      inActiveIcon: Assets.icons.interests,
      label: DashboardConstants.myInterest,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, DashBoardProvider dashBoardProvider, child) {
        return Scaffold(
            body: Container(
              width: double.maxFinite,
              height: SizeConfig.screenHeight,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppColors.lightBlack,
                    AppColors.black,
                  ])),
              child: Center(
                child: _dashboardTabs[dashBoardProvider.selectedIndex],
              ),
            ),
            bottomNavigationBar: Container(
              height: 66.heightMultiplier,
              width: double.maxFinite,
              color: AppColors.tabBarBrown,
              // decoration: BoxDecoration(gradient: LinearGradient(colors: [])),
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bottomIcons.length, (index) {
                  final bottomIconData = bottomIcons[index];
                  return GestureDetector(
                    onTap: () => _onItemTapped(index),
                    child: Container(
                      height: 50.heightMultiplier,
                      width: 81.5.widthMultiplier,
                      decoration: dashBoardProvider.selectedIndex == index
                          ? BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16))
                          : null,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              dashBoardProvider.selectedIndex == index
                                  ? bottomIconData.activeIcon
                                  : bottomIconData.inActiveIcon,
                              color: dashBoardProvider.selectedIndex == index
                                  ? AppColors.pink
                                  : AppColors.white,
                            ),
                            Text(
                              bottomIconData.label,
                              style: dashBoardProvider.selectedIndex == index
                                  ? AppTextStyle.f12W500Pink
                                  : AppTextStyle.f12W400White,
                            )
                          ]),
                    ),
                  );
                }),
              ),
            )
            //  BottomNavigationBar(
            //   selectedItemColor: AppColors.pink,
            //   unselectedItemColor: AppColors.white,
            //   unselectedLabelStyle: AppTextStyle.f12W400White,
            //   selectedLabelStyle: AppTextStyle.f12W500Pink,
            //   currentIndex: dashBoardProvider.selectedIndex,
            //   backgroundColor: AppColors.tabBarBrown,
            //   type: BottomNavigationBarType.fixed,
            //   onTap: _onItemTapped,
            //   items: List.generate(_dashboardTabs.length, (index) {
            //     final BottomNavItemData bottomIconData = bottomIcons[index];
            //     return BottomNavigationBarItem(
            //         icon: SvgPicture.asset(
            //           bottomIconData.inActiveIcon,
            //           color: Colors.white,
            //         ),
            //         activeIcon: SvgPicture.asset(
            //           bottomIconData.activeIcon,
            //           color: Colors.pink,
            //         ),
            //         label: bottomIconData.label);
            //   }),
            // ),
            );
      },
    );
  }
}

class BottomNavItemData {
  final String activeIcon;
  final String inActiveIcon;
  final String label;
  BottomNavItemData({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.label,
  });
}
