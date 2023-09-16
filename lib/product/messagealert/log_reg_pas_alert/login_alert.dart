import 'package:flutter/material.dart';
import 'package:mytodo/product/constants/img_constant.dart';
import 'package:mytodo/product/constants/string_constant.dart';
import 'package:mytodo/product/widget/text_widget/label_medium_text.dart';
import 'package:mytodo/product/widget/text_widget/title_medium_text.dart';

class LoginAlertService {
  LoginAlertService(BuildContext context) : _context = context;
  // ignore: unused_field
  final BuildContext _context;

  // user not found dialog
  void userNotFountDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ImgIMGConstant.appLoginUserNotImg.toImg5,
      ),
      content: const TitleMediumBlackBoldText(
        text: StringLoginConstant.logUserNotFount,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LabelMediumGreyBoldText(
              textAlign: TextAlign.center,
              text: "Tamam",
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  // wrong password dialog
  void wrontPasswordDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ImgIMGConstant.appLoginErrPassImg.toImg5,
      ),
      content: const TitleMediumBlackBoldText(
        text: StringLoginConstant.wronPassword,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LabelMediumGreyBoldText(
              textAlign: TextAlign.center,
              text: "Tamam",
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  // too many request dialog
  void tooManyRequestDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ImgIMGConstant.appLoginTooManyRequestImg.toImg5,
      ),
      content: const TitleMediumBlackBoldText(
        text: StringLoginConstant.tooManyRequest,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LabelMediumGreyBoldText(
              textAlign: TextAlign.center,
              text: "Tamam",
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  // email not verified dialog
  void emailNotVerifiedDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: ImgIMGConstant.appLoginEmailNotVerified.toImg5,
      ),
      content: const TitleMediumBlackBoldText(
        text: StringLoginConstant.emailNotVerified,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LabelMediumGreyBoldText(
              textAlign: TextAlign.center,
              text: "Tamam",
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
