import 'package:flutter/material.dart';
import 'package:mytodo/product/extension/view_size/viewsize_model.dart';
import 'package:mytodo/product/messagealert/log_reg_pas_alert/password_alert.dart';
import 'package:mytodo/product/models/log_reg_pass_model/forgot_password/forgot_password_model.dart';
import 'package:mytodo/product/router/log_reg_pass_router/password_router.dart';
import 'package:mytodo/product/utility/firebase/service/firebase_service.dart';

abstract class MainForgotPasswordBase<T extends StatefulWidget>
    extends State<T> {
  // model & database
  ForgotPasswordModelService serviceModel = ForgotPasswordModelService();
  FirebaseService firebaseService = FirebaseService();

  // router service
  ForgotPasswordRouter serviceRouter = ForgotPasswordRouter();

  // screen size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModel(context).mediaSize.width;
  late final maxHeight = ViewSizeModel(context).mediaSize.height;

  // reset pass send mail
  Future<void> sendResEmail() async {
    await firebaseService.auth
        .sendPasswordResetEmail(
          email: serviceModel.emailController.text.toString(),
        )
        .then((value) => {
              ResPasswordAlertService(context).alertEmailTrueDialog(context),
              serviceModel.emailController.clear(),
            })
        .catchError((err) => {
              ResPasswordAlertService(context).alertEmailFalseDialog(context),
              serviceModel.emailController.clear(),
            });
  }
}
