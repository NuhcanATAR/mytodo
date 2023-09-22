import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarModelService {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  TextEditingController noteController = TextEditingController();
  String selectedNote = '';
  String selectedExplanation = '';
  String selectedLocation = '';
  bool? selectedCheckStatus;
  // logger
  dynamic logger = Logger();

  // activity status
  bool isActivityStatus = false;

  // form key
  final formActivityKey = GlobalKey<FormState>();

  // controller
  TextEditingController title = TextEditingController();
  TextEditingController explanation = TextEditingController();
  TextEditingController location = TextEditingController();

  // validator
  String? titleValidator(String? titleVal) {
    if (titleVal == null || titleVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }
}
