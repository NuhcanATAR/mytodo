import 'package:flutter/material.dart';

// pub dev
import 'package:logger/logger.dart';

// firebase
import 'package:firebase_auth/firebase_auth.dart';

class HomeModelService {
  late final date = DateTime.now();
  late final days = date.day;
  late final month = date.month;
  late final year = date.year;
  late final hour = date.hour;

  late final List<DateTime> nextDays = List.generate(
    20,
    (index) => date.add(Duration(days: index)),
  );

  final formNotAddKey = GlobalKey<FormState>();
  final formNotUpdKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController explanationController = TextEditingController();

  TextEditingController titleUpdController(Map<String, dynamic> data) =>
      TextEditingController(
        text: data['TITLE'].toString(),
      );
  TextEditingController explanationUpdController(Map<String, dynamic> data) =>
      TextEditingController(
        text: data['EXPLANATION'],
      );
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

  final userID = FirebaseAuth.instance.currentUser!.uid;

  var logger = Logger();
}
