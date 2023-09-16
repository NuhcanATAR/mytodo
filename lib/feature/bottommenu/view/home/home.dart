import 'package:flutter/material.dart';
import 'package:mytodo/feature/bottommenu/view/home/widget/appbar_widget.dart';
import 'package:mytodo/feature/bottommenu/view/home/widget/calendarlist_widget.dart';
import 'package:mytodo/feature/bottommenu/view/home/widget/categorylist_widget.dart';
import 'package:mytodo/feature/bottommenu/view/home/widget/noteslist_widget.dart';
import 'package:mytodo/product/utility/base/home_base/home_base.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends MainHomeBase<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // appbar
          buildAppBarWidget,
          // calendar
          buildCalendarWidget,
          // category list
          buildCategoryList,
          // notes
          buildNotesWidget,
          const SizedBox(
            height: 400,
          ),
        ],
      ),
    );
  }

  // appbar
  Widget get buildAppBarWidget => AppBarWidget(
        dynamicWidth: dynamicWidth,
        dynamicHeight: dynamicHeight,
        maxwidth: maxWidth,
        day: serviceModel.days,
        month: serviceModel.month,
        year: serviceModel.year,
        hour: serviceModel.hour,
      );

  // calendar
  Widget get buildCalendarWidget => CalendarListWidget(
        maxWidth: maxWidth,
        dynamicWidth: dynamicWidth,
        dynamicHeight: dynamicHeight,
        nextDays: serviceModel.nextDays,
        day: serviceModel.days,
      );

  // category list
  Widget get buildCategoryList => CategoryListWidget(
        maxWidth: maxWidth,
        dynamicWidth: dynamicWidth,
        dynamicHeight: dynamicHeight,
      );

  // notes
  Widget get buildNotesWidget => NotesListWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        serviceModel: serviceModel,
        notAdd: notAdd,
        notDelete: notDelete,
        notUpd: notUpd,
      );
}
