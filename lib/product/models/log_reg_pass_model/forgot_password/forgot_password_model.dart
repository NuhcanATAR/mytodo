import 'package:flutter/material.dart';

class ForgotPasswordModelService {
  // form key
  final formResPassKey = GlobalKey<FormState>();

  // controller
  TextEditingController emailController = TextEditingController();

  // validator

  // email
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan!";
    } else {
      return null;
    }
  }

  // input
  bool isEmailinp = false;
}
