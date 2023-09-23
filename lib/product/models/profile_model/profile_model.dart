import 'package:flutter/material.dart';

// pub dev
import 'package:logger/logger.dart';

class ProfileServiceModel {
  // form key
  final passwordUpdKey = GlobalKey<FormState>();

  // controller
  TextEditingController password = TextEditingController();

  // validator
  String? passValidator(String? passVal) {
    if (passVal == null || passVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  // input
  bool inputBorder = false;

  // logger
  var logger = Logger();
}
