import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class TodoModelService {
  // form keys
  final formMettingAddKey = GlobalKey<FormState>();
  final formGoingPlaceAddKey = GlobalKey<FormState>();

  // controller
  TextEditingController titleController = TextEditingController();
  TextEditingController explanationController = TextEditingController();

  // date
  DateTime selectdateTime = DateTime.now();

  DateTime selectStartdateTime = DateTime.now();

  DateTime selectEnddateTime = DateTime.now();

  // validator
  String? titleValidator(String? titleVal) {
    if (titleVal == null || titleVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? explanationValidator(String? explanationVal) {
    if (explanationVal == null || explanationVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }

  // input
  bool inputBorder = false;

  // logger
  var logger = Logger();

  // city list
  List<String> cityList = <String>[
    "Çorum",
    "Ankara",
  ];

  // city value
  late String cityStartSelect = cityList.first;
  late String cityFinishSelect = cityList.first;
}
