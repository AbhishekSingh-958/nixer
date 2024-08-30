import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nixler_demo/core/components/search_field.dart';
import 'package:nixler_demo/core/extensions/size_extension.dart';
import 'package:nixler_demo/core/theme/app_colors.dart';
import 'package:nixler_demo/core/theme/app_textstyle.dart';
import 'package:nixler_demo/core/utils/common_functions.dart';
import 'package:nixler_demo/gen/assets.gen.dart';
import 'package:nixler_demo/src/features/events/provider/event_provider.dart';
import 'package:nixler_demo/src/features/events/view/event_detail_screen.dart';
import 'package:nixler_demo/src/features/events/widgets/event_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/size_config.dart';

class LiveMusicScreen extends StatefulWidget {
  const LiveMusicScreen({super.key});

  @override
  State<LiveMusicScreen> createState() => _LiveMusicScreenState();
}

class _LiveMusicScreenState extends State<LiveMusicScreen> {
  late EventProvider eventProvider;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    eventProvider = Provider.of<EventProvider>(context, listen: false);
    fetchData();
  }

  Future<void> fetchData() async {
    await eventProvider.fetchEventDetails();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(
            20.widthMultiplier,
            50.heightMultiplier,
            20.widthMultiplier,
            20.heightMultiplier,
          ),
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
            child: Column(
              children: [
                _buildHeader(),
                16.verticalSpace,
                SearchField(
                  onChanged: (text) {
                    eventProvider.filterMusicList(text);
                  },
                  onCutTap: () {
                    eventProvider.filterMusicList('');
                  },
                  controller: _searchController,
                ),
                24.verticalSpace,
                _filterSection(),
                24.verticalSpace,
                Expanded(
                  child: Consumer<EventProvider>(
                      builder: (context, eventProvider, _) {
                    final data = eventProvider.filteredLiveMusicList;
                    return ListView.separated(
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EventDetailScreen(
                                    liveMusicData: data![index]),
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.heightMultiplier),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.lightOlive.withOpacity(0.2)),
                              child: EventCard(
                                date: getFormattedDate(
                                    data?[index].eventVisibilityStartDate,
                                    data?[index].eventVisibilityEndDate!),
                                image: data?[index].coverImageUrl ?? '',
                                locationAddress: data?[index].address ?? '',
                                title: data?[index].title ?? '',
                              ),
                            ),
                          );
                        });
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _filterSection() {
    return SingleChildScrollView(
      child: Row(
        children: [
          _chip('Under 10Km'),
          _chip('Live Music'),
          _chip('NightLife & Bar'),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightOlive.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.symmetric(
          vertical: 5.heightMultiplier, horizontal: 8.widthMultiplier),
      child: Text(
        label,
        style: AppTextStyle.f12W500White,
      ),
    );
  }

  Widget _buildHeader() {
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
}
