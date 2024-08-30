import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nixler_demo/core/utils/common_functions.dart';
import 'package:nixler_demo/src/features/events/model/live_music.dart';
import 'package:nixler_demo/src/features/events/repository/event_repository.dart';

class EventProvider extends ChangeNotifier {
  List<LiveMusicData>? originalLiveMusicList;
  List<LiveMusicData>? filteredLiveMusicList;
  EventRepository eventRepository;
  EventProvider(this.eventRepository);
  Future<void> fetchEventDetails() async {
    try {
      String id = '66b195fcf061bbc1c22731dd';
      final data = await eventRepository.fetchLiveMusic(id);

      LiveMusic liveMusic = LiveMusic.fromJson(data);
      originalLiveMusicList = liveMusic.data ?? [];
      filteredLiveMusicList = originalLiveMusicList;
      notifyListeners();
    } catch (e) {
      showSimpleSnackbar('Check Your Network Connection');
    }
  }

  void filterMusicList(String searchText) {
    if (searchText.isEmpty) {
      filteredLiveMusicList = originalLiveMusicList;
    } else {
      filteredLiveMusicList = originalLiveMusicList
          ?.where((element) =>
              element.title?.toLowerCase().contains(searchText.toLowerCase()) ??
              false)
          .toList();
    }
    notifyListeners();
  }
}
