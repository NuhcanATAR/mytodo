// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/models/log_reg_pass_model/register/register_model.dart';
import 'package:mytodo/product/router/log_reg_pass_router/register_router.dart';
import 'package:mytodo/product/utility/firebase/database/log_reg_pas_db/registerdb.dart';
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';

import '../../../../messagealert/log_reg_pas_alert/register_alert.dart';

abstract class MainRegisterBase<T extends StatefulWidget> extends State<T> {
  // model & database
  RegisterModelService serviceModel = RegisterModelService();
  FirebaseService firebaseService = FirebaseService();

  // router service
  RegisterRouterPush serviceRouter = RegisterRouterPush();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // register auth
  Future<void> registerUser() async {
    try {
      UserCredential userCredential =
          await firebaseService.auth.createUserWithEmailAndPassword(
        email: serviceModel.emailController.text,
        password: serviceModel.passwordController.text,
      );

      await RegisterServiceDb.USERS.refCol
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "ID": FirebaseAuth.instance.currentUser!.uid,
        "NAME": serviceModel.nameController.text,
        "SURNAME": serviceModel.surnameController.text,
        "MAIL": serviceModel.emailController.text,
        "PASSWORD": serviceModel.passwordController.text,
      }).then((value) {
        serviceModel.logger.i(
            "Kayıt Başarılı: ${serviceModel.nameController.text} ${serviceModel.surnameController.text}");
      }).catchError((err) {
        serviceModel.logger.e("Hata: $err");
      });

      User? userAuth = userCredential.user;
      await userAuth?.sendEmailVerification();

      RegisterAlertService(context).voidRegisterEndDialog(context);
      serviceModel.nameController.clear();
      serviceModel.surnameController.clear();
      serviceModel.emailController.clear();
      serviceModel.passwordController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        RegisterAlertService(context).voidEmailDialog(context);
      }
    } catch (e) {
      serviceModel.logger.e("Hata: $e");
    }
  }
}
