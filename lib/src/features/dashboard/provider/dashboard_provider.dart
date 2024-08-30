import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  int _currCategoryIndex = 0;
  int _selectedIndex = 0;


  int get currCategoryTabIndex => _currCategoryIndex;
  int get selectedIndex => _selectedIndex;


  void selectCategoryByIndex(int index) {
    _currCategoryIndex = index;
    _selectedIndex = index;
    notifyListeners();
  }
   
}