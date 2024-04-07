import 'package:flutter/material.dart';

class GlobalStateHandler extends ChangeNotifier {
  int selectHomePage = 0;
  bool isLoggedIn = false;
  String userType = 'student';
  Map userInfo = {};

  setSelectedHomePage(int currentHome) {
    selectHomePage = currentHome;
    notifyListeners();
  }

  setIsLoggedIn(bool cond) {
    isLoggedIn = cond;
    notifyListeners();
  }
}
