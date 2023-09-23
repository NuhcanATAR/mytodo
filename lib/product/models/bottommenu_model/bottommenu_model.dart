import 'package:flutter/material.dart';

// view routers
import 'package:mytodo/feature/bottommenu/view/calendar/calendar.dart';
import 'package:mytodo/feature/bottommenu/view/favrority/favority.dart';
import 'package:mytodo/feature/bottommenu/view/home/home.dart';
import 'package:mytodo/feature/bottommenu/view/important/important.dart';
import 'package:mytodo/feature/bottommenu/view/profile/profile.dart';

class BottomMenuServiceModel {
  int currentMenuIndex = 0;

  List<Widget> viewList = <Widget>[
    const HomeView(),
    const ImportantView(),
    const FavorityView(),
    const CalendarView(),
    const ProfileView(),
  ];
}
