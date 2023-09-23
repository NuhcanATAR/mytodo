import 'package:flutter/material.dart';

// pub dev
import 'package:logger/logger.dart';

class RegisterModelService {
  // form key
  final formRegisterKey = GlobalKey<FormState>();

  // controller
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // validator

  // name
  String? nameValidator(String? nameVal) {
    if (nameVal == null || nameVal.isEmpty) {
      return "Zorunlu Alan!";
    } else {
      return null;
    }
  }

  // surname
  String? surnameValidator(String? surnameVal) {
    if (surnameVal == null || surnameVal.isEmpty) {
      return "Zorunlu Alan!";
    } else {
      return null;
    }
  }

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
  bool isNameinp = false;
  bool isSurnameinp = false;
  bool isEmailinp = false;
  bool isPasswordinp = false;

  // password open / close
  bool isPassObscured = true;

  // logger
  var logger = Logger();
}
