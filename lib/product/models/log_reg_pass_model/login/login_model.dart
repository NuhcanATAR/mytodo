import 'dart:async';

import 'package:flutter/material.dart';

// pub dev
import 'package:logger/logger.dart';

class LoginServiceModel {
  // form key
  final formLoginKey = GlobalKey<FormState>();

  // controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // validator

  // email
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan!";
    } else {
      return null;
    }
  }

  // password
  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "Zorunlu Alan!";
    } else {
      return null;
    }
  }

  // input
  bool isEmailinp = false;
  bool isPasswordinp = false;

  // password open / close
  bool isPassObscured = true;

  // remember me check
  bool isRememberChecked = false;

  // connectivity controller
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertDialog = false;

  // logger
  var logger = Logger();
}
